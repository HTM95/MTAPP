import 'package:flutter/material.dart';
//import 'PageIndicator.dart';
import 'commande.dart';
import 'products_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailUI extends StatefulWidget{
  _ProductDetailState createState()=> new _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailUI> {

  int currentIndex = 0;
  void _nextImage(){
    setState(() {
      if(currentIndex < 3){
        currentIndex ++;
      }else{
        currentIndex = currentIndex;
      }
    });
  }

  void _prevImage(){
    setState(() {
      if(currentIndex > 0){
        currentIndex --;
      }else{
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Commande_Repository cmd = new Commande_Repository();
    dataDetails  D = ModalRoute.of(context).settings.arguments;
    DocumentSnapshot document = D.documentSnapshot;
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
                child : SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network( document['imageUrl1'].toString(),
                      fit: BoxFit.cover,),
                    //Image.asset(productImage[currentIndex])
                    Positioned(
                      top: 40.0,
                      left: 24.0,
                      child: IconButton(icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ), onPressed:() {Navigator.pop(context);}
                      ),
                    ),
                    Positioned(
                      top: 150.0,
                      left: 35.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            document['name'] ,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Montserrat-Bold",
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            height:4.0 ,),
                          Text('Details' , style: TextStyle(fontSize: 20,color: Colors.white),
                          //TODO : currentindex
                          ),
                          SizedBox(height: 40,),
                          Text( document['prix' + D.profil].toString() + ' DH', style: TextStyle(
                            //TODO : currentindex
                            fontSize: 35,
                            fontFamily: "Montserrat-Bold",
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          SizedBox(
                            width: 70.0,
                            //child: PageIn,
                          )
                        ],
                      ),
                    ),
                    Positioned.fill(
                        child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details){
                      if(details.velocity.pixelsPerSecond.dx>0){
                              _prevImage();
                              print('prev');
                            }
                            else if(details.velocity.pixelsPerSecond.dx <0){
                              _nextImage();
                              print('next');
                            }
                          },
                        ))
                  ],
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(document['desc'],
                    style: TextStyle(
                      fontSize: 30.0 ,
                      fontFamily: "Montserrat-Bold",
                      color: Colors.black,
                    ),
                    ),
                    Text('Lorem ipsum dolor sit amet,'
                        ' consectetur adipiscing elit, '
                        'sed do eiusmod tempor incididunt ut labore',
                          style: TextStyle(color: Colors.grey),),
                  ],
                ),

              )
            ],
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
              child: SizedBox(
                width: 160.0,
                height: 60.0,
                child: Row(
                  children: <Widget>[
                  /*  Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                        child: Center(
                          child: Icon(Icons.favorite_border,color: Colors.white,),
                        ),
                      ),

                    ),*/
                    Expanded(

                    child:GestureDetector(
                    onTap: (){
                      cmd.displayDialog(context , document);
                    },
                    child : Container(
                    color: Colors.indigo,
                    child: Center(
                    child: Icon(Icons.shopping_basket,color: Colors.white)
                    ),
                    ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}