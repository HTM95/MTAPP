import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              //image: AssetImage("assets/images/login.png"),
              image: AssetImage("assets/Iconbackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          //color: Colors.white,
          padding: EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: SizedBox(
                    //width: 74,
                    height: 100,
                    child: Text("Connexion",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Calibri',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      decoration: new BoxDecoration(
                        border: Border.all(
                        width: 0.5
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(25) //                 <--- border radius here
                      ),
                      ),
                      child: Column(
                        children: <Widget>[
                          //BorderRadius.all(Radius.circular(25)),
                          TextField(
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          //controller: emailEditingController,
                          decoration: InputDecoration(
                            //labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0)
                              ),
                              borderSide: BorderSide(color: Colors.greenAccent, width: 5.0)
                            )
                          ),
                        ),
                    TextField(
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      //controller: emailEditingController,
                      decoration: InputDecoration(
                        //labelText: "Password",
                        hintText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(25.0),
                                bottomRight: const Radius.circular(25.0)
                              ),
                        )
                      ),
                    ),
                        ],
                      ),
                ),
                    ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                child: new FloatingActionButton(
                      backgroundColor: Colors.lightBlue,
                      child: Icon(Icons.arrow_right),
                      mini: true,
                      onPressed: () => {
                        Navigator.pop(context),
                      }
                    ),
                ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonTheme(
                  minWidth: 150,
                  shape: StadiumBorder(),
                  child: MaterialButton(
                    onPressed: () => {
                      Navigator.of(context).pushNamed('/register')
                    },
                    textColor: Colors.lightBlue,
                    color: Colors.white,
                    height: 50,
                    child: Text("S'inscrire",
                        style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),), 
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}