import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Commande_Repository {

  TextEditingController _textFieldController = new TextEditingController();

  displayDialog(BuildContext context ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Saisir la Quantité'),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: _textFieldController,
              decoration: InputDecoration(hintText: ""),
            ),
            actions: <Widget>[
              new RaisedButton(
                color: Colors.blueAccent,
                child: new Text('Commander' , style: TextStyle(color: Colors.white),),
          onPressed:(){
            DocumentReference refProd = Firestore.instance.collection('products').document('guEgu2sjsyOsSEChu2fT');
            DocumentReference refClient = Firestore.instance.collection('products').document('guEgu2sjsyOsSEChu2fT');
                  Map<String,dynamic> data = {
                    'dateCommande': Timestamp.fromDate(DateTime.now()),
                    'produit': refProd ,
                    'qte':_textFieldController.text.toString() ,
                    'client' : refClient
                  };
                  Firestore.instance.collection('commande').document()
                         .setData(data).whenComplete((){
                           Navigator.of(context).pop();
                           _textFieldController.clear();
                           new SnackBar(
                               content: Text('Commande Reusie'));

                         });

          },
              ),
              new FlatButton(

                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _textFieldController.clear();
                },
              )
            ],
          );
        });
  }
}