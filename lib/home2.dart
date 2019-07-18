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
import 'package:intl/intl.dart';
import 'supplemental/asymmetric_view.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
class HomePage2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Stack _buildBox(String image , double h , double w , String Titre){

      return Stack(
          children : <Widget>[
      ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: new BorderRadius.circular(35.0),
          child :GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/products');
            },
          child:Container(
              padding: EdgeInsets.only(left: 10.0),
               height: MediaQuery.of(context).size.height * h,//0.3,
                width: MediaQuery.of(context).size.width * w ,//0.45,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage(image),
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
                    Text(
                        Titre,
                      style: TextStyle(color: Colors.white,fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
        ]
       );
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
          children: <Widget>[
            SizedBox(height: 130,),
            Row(
              children : [
              Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.height * 0.011),
            child :_buildBox('assets/tiles.jpg',0.3,0.45,'TILES'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child :_buildBox('assets/fraise.jpg',0.3,0.45,'FRIEZES'),
            ),
            ]
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child :_buildBox('assets/decor.jpg',0.25,0.8,'DECORS'),
            ),
          ],
        )
        ),
      )
    );
  }
}
