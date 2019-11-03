import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_with_firebase.dart';

class ContactUs extends StatefulWidget {

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     /* appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
          children: <Widget>[
            Icon(Icons.contacts),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text('Contactez-nous'),
            ),
          ],
          ),//child:
        ),
        backgroundColor: Colors.blueAccent,
      ),*/
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 100),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 90, top: 50),
                child: IconButton(icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ), onPressed:() {Navigator.pop(context);}
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                //margin: const EdgeInsets.only(left: 90),
                //padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    new Tab(
                      icon: new Image.asset('assets/tel.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14),
                      child: InkWell(
                        child: Text("0631-323232",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () async {
                          if (await canLaunch("tel://+212631323232")) {
                            await launch("tel://+212631323232");
                          }
                        },
                      ),
                      /*child: Text('0607080910',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          )),*/
                    ),
                    /*Image.asset(assets/images/tel.png),
                    Icon(Icons.accessibility),
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessible_forward),*/
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(left: 90),
                //padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    new Tab(
                      icon: new Image.asset('assets/tel.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14),
                      child: InkWell(
                        child: Text("0520-481780",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () async {
                          if (await canLaunch("tel://+212520481780")) {
                            await launch("tel://+212520481780");
                          }
                        },
                      ),
                      /*child: Text('0607080910',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          )),*/
                    ),
                    /*Image.asset(assets/images/tel.png),
                    Icon(Icons.accessibility),
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessible_forward),*/
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(left: 90),
                //padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    new Tab(
                      icon: new Image.asset('assets/address.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        child: Text("Mosaics",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () async {
                          if (await canLaunch("https://www.google.fr/maps/@33.5920397,-7.6419162,21z")) {
                            await launch("https://www.google.fr/maps/@33.5920397,-7.6419162,21z");
                          }
                        },
                      ),
                      /*child: Text('Quartier Racine',
                              style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                          ),
                      ),*/
                    ),
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(left: 90),
                //padding: EdgeInsets.only(right: 1),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    new Tab(
                      icon: new Image.asset('assets/fb.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        child: Text("Mosaics",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () async {
                          if (await canLaunch("https://www.facebook.com/mosaicspool/?ref=br_rs")) {
                            await launch("https://www.facebook.com/mosaicspool/?ref=br_rs");
                          }
                        },
                      ),
                      /*child: Text('Facebook',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          )),*/
                    ),
                    /*Image.asset(assets/images/tel.png),
                    Icon(Icons.accessibility),
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessible_forward),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}