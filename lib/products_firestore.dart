
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'commande.dart';
import 'home2.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductsPageFS extends StatefulWidget{
  _ProductsPageStateFS createState()=> _ProductsPageStateFS();
}
class _ProductsPageStateFS extends State<ProductsPageFS>{
  Commande_Repository cmd = new Commande_Repository();

 Widget _buildListItem2(BuildContext context , DocumentSnapshot document ,String profil ,String phone){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/details',
              arguments:dataDetails(document,profil,phone)
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 9,
                child: CachedNetworkImage(
                  imageUrl: document['imageUrl1'].toString(),
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fit: BoxFit.fitWidth,
                ),

                /*Image.network(
                  document['imageUrl1'].toString(),
                  fit: BoxFit.fitWidth,
                ),*/
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        document['name'],
                        //style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 1.0),
                      Text(
                          document['prix' + profil].toString() + ' DH'
                      ),

                      IconButton(
                        // padding: EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 0.0),
                        //iconSize: 25.0,
                        icon: Icon(
                          Icons.shopping_cart,
                          size: MediaQuery
                              .of(context)
                              .size
                              .height * 0.035,
                          color: Color(0xFF0D47A1),
                          semanticLabel: 'search',
                        ),
                        //TODO : Add popup to select qte
                        onPressed: () {
                          cmd.displayDialog(context , document , phone);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    sdata D = ModalRoute.of(context).settings.arguments;
    String categ = D.title.toString().split('.').last;
    String profil = D.userCateg;
    String phone = D.userPhone;
    // TODO: Return an AsymmetricView (104)
    // return  AsymmetricView(products: ProductsRepository.loadProducts(Category.all));
    return
          StreamBuilder(
          stream: Firestore.instance.collection('produits').where('category' , isEqualTo: categ).snapshots(),
          builder: (context , snapshot){
            if(!snapshot.hasData) return const Text('Loading ...');
            return GridView.builder(
                itemCount: snapshot.data.documents.length,
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context,index)=>
                    _buildListItem2(context , snapshot.data.documents[index], profil , phone),
            );
            },
          );
  }
}

class dataDetails{
  DocumentSnapshot documentSnapshot;
  String userCateg;
  String userPhone;
  dataDetails(this.documentSnapshot,this.userCateg,this.userPhone);
}