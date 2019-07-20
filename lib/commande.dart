import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
class Commande_Repository {

  TextEditingController _textFieldController = new TextEditingController();

  displayDialog(BuildContext context , DocumentSnapshot document ) async {
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
          onPressed:() async {
                  if(int.parse(_textFieldController.text.toString()) <= document['qte']) {
                    FirebaseUser user = await FirebaseAuth.instance
                        .currentUser();
                    DocumentReference refProd = Firestore.instance.collection(
                        'products').document(document.documentID);
                    DocumentReference refClient = Firestore.instance.collection(
                        'products').document(user.uid);

                    Map<String, dynamic> data = {
                      'dateCommande': Timestamp.fromDate(DateTime.now()),
                      'produit': refProd,
                      'qte': _textFieldController.text.toString(),
                      'client': refClient,
                      'valider': false,
                    };
                    //TODO : Ajouter la reffenrence du client et du produit

                    Firestore.instance.collection('commande').document()
                        .setData(data).whenComplete(() {
                      Navigator.of(context).pop();
                      _textFieldController.clear();
                      Toast.show('Commande réusite', context , duration: Toast.LENGTH_LONG);
                    });
                  }else {
                    Toast.show('quantité non valable', context, duration: Toast.LENGTH_LONG );
                  }
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