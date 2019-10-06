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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/product.dart';

class HomePage2 extends StatelessWidget {

  FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    Stack _buildBox(String image , double h , double w , String categ,String Title){

      return Stack(
          children : <Widget>[
      ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: new BorderRadius.circular(35.0),
          child :GestureDetector(
            onTap: () async{
              String profil;
              String phone;

              FirebaseUser user1 = await FirebaseAuth.instance.currentUser();
              if(user1!=null){
                _messaging.getToken().then((token)=>{
                Firestore.instance.collection("utilisateurs").document(user1.uid).updateData({ 'devtoken': token,}),
                    print('token ' + token.toString()),
                });

                Firestore.instance
                    .collection('utilisateurs')
                    .document(user1.uid)
                    .get()
                    .then((DocumentSnapshot ds) {
                  
                  profil = ds['categorie'].toString();
                  phone = ds['tel'].toString();
                  Category g = Category.values.firstWhere((e) => e.toString() == 'Category.' + categ);
                  Navigator.pushNamed(context, '/products' , arguments: sdata(g,profil,phone));
                });
              }else{
                profil = "Particulier";
                phone = "0000";
                Category g = Category.values.firstWhere((e) => e.toString() == 'Category.' + categ);
                Navigator.pushNamed(context, '/products' , arguments: sdata(g,profil,phone));
              }
            },
          child:Container(
              padding: EdgeInsets.only(left: 10.0),
               height: MediaQuery.of(context).size.height * h,//0.3,
                width: MediaQuery.of(context).size.width * w ,//0.45,
              decoration: new BoxDecoration(

                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: new AssetImage(image ),
                fit: BoxFit.cover,
            )
              ),
            ),
          ),
      ),

            Container(
              height: MediaQuery.of(context).size.height* h,//0.2,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width * w,//0.45,
             // decoration: BoxDecoration(color: Color.fromARGB(55, 13, 71, 161)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.06
                ),
                    Center(
                      child: Text(
                          Title,
                        style: TextStyle(color: Colors.white ,fontSize: 20.0,fontFamily: 'Josefin Sans'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ]
       );
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
          child : Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Row(
              children : [
              Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.height * 0.011),
            child :_buildBox('assets/tiles.jpg',0.3,0.45,Category.Carreaux.toString().split('.').last,"Carreaux en pâte de verre"),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child :_buildBox('assets/fraise.jpg',0.3,0.45,Category.Frises.toString().split('.').last,"Frises"),
            ),
            ]
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child :_buildBox('assets/decor.jpg',0.25,0.8,Category.Decors.toString().split('.').last,"Décors en pâte de verre"),
            ),
          ],
        )
        ),
        ),
      )
    );
  }
}
class sdata {

  Category title;
  String userCateg;
  String userPhone;

  sdata(this.title,this.userCateg,this.userPhone);
}