import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/home2');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFB3E5FC),
      body: Center(
        child: Container(child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: FlatButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed('/home2')
                },
                padding: EdgeInsets.all(50.0),
                child: Image.asset('assets/mosaic_logo.png')
      ),
    ),
    ),
      ),
    );
  }


}