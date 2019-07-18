// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsPageFS extends StatefulWidget{
  _ProductsPageStateFS createState()=> _ProductsPageStateFS();
}
class Produit{
  final String Nom;
  final String Id;
  final String Prix;
  final String image;

  Produit(this.Nom , this.Id , this.Prix , this.image);
}
class _ProductsPageStateFS extends State<ProductsPageFS> {



  Widget _buildListItem2(BuildContext context , DocumentSnapshot document ){
    return  GestureDetector(
            onTap: (){
             Navigator.pushNamed(context, '/details',
              arguments: Produit(document['NomProd'].toString(),document['Id'].toString(),document['Prix'].toString(),document['Image'].toString())
             );
      },
           child : Card(
             clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/9,
              child : Image.network(
               document['Image'].toString(),
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      document['NomProd'],
                      //style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 1.0),
                    Text(
                     document['Prix'].toString()
                    ),
                    IconButton(
                      // padding: EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 0.0),
                      //iconSize: 25.0,
                      icon: Icon(
                        Icons.shopping_basket,
                        size:  MediaQuery.of(context).size.height * 0.035,
                        color: Color(0xFF0D47A1),
                        semanticLabel: 'search',
                      ),
                      //TODO : Add popup to select qte
                      onPressed: (){
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
    // TODO: Return an AsymmetricView (104)
    // return  AsymmetricView(products: ProductsRepository.loadProducts(Category.all));
    return
          StreamBuilder(
          stream: Firestore.instance.collection('products').snapshots(),
          builder: (context , snapshot){
            if(!snapshot.hasData) return const Text('Loading ...');
            return GridView.builder(
                itemCount: snapshot.data.documents.length,
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context,index)=>
                    _buildListItem2(context , snapshot.data.documents[index]),
            );
          },
          );
  }
}
