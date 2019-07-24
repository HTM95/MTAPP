import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          margin: const EdgeInsets.only(left: 70),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 110,
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
                          if (await canLaunch("tel://0631-323232")) {
                            await launch("tel://0631-323232");
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
                        child: Text("Marine Turquoise",
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
                        child: Text("Marine Turquoise",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () async {
                          if (await canLaunch("https://www.facebook.com/MarineTurquoise/")) {
                            await launch("https://www.facebook.com/MarineTurquoise/");
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