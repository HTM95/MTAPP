import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class UserLogin extends StatefulWidget {

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  //String _email, _password;
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var  devToken='';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          //color: Colors.white,
          padding: EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 130,
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
                      //height: MediaQuery.of(context).size.height/5.2,
                      margin: const EdgeInsets.only(left: 30),
                      decoration: new BoxDecoration(
                        /*border: Border.all(
                          //color: Color(0xFFB3E5FC),
                        width: 0.001
                      ),*/
                      /*borderRadius: BorderRadius.all(
                          Radius.circular(25), //                 <--- border radius here
                      ),*/
                      ),
                      child: Column(
                        children: <Widget>[
                          //BorderRadius.all(Radius.circular(25)),
                          TextField(
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              filled: true,
                            fillColor: Color(0xFFE1F5FE),
                            //labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            /*border: OutlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0)
                              ),
                              borderSide: BorderSide(color: Colors.greenAccent, width: 5.0)
                            )*/
                          ),
                        /*validator: (input) {
                          if(input.isEmpty){
                            return 'Veuillez entrer un email';
                          }
                        },  
                        onSaved: (input) {
                          _email = input;
                        },*/
                        ),
                    TextField(
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      controller: pwdController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE1F5FE),
                        //labelText: "Email",
                        hintText: "Mot de passe",
                        labelStyle: TextStyle(
                          height: 1.0,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(25.0),
                                bottomRight: const Radius.circular(25.0)
                              ),
                        )*/
                      ),
                      /*validator: (input) {
                          if(input.length < 8){
                            return 'Votre mot de passe doit contenir au moins 8 caractères';
                          }
                        },  
                        onSaved: (input) {
                          _password = input;
                        },*/
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
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(child: CircularProgressIndicator(),);
                            });
                        await signIn();
                        //Navigator.pop(context);
                      },
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
                ),
                FlatButton(
                  child: Text('Mot de passe oublié', style: new TextStyle(
                    fontSize: 11,
                    color: Colors.lightBlue,
                  ),), 
                  onPressed: () {
                    Navigator.of(context).pushNamed('/emailConfirm');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: pwdController.text);

        Toast.show('Connecté', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        Navigator.of(context).pushNamed('/home2');
      }catch(e){
        switch(e.message){
          case 'Given String is empty or null':
            Toast.show('Veuillez remplir les champs', context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            Toast.show('Erreur de connexion', context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            break;
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            Toast.show('Email incorrect', context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            break;
          case 'The password is invalid or the user does not have a password.':
            Toast.show('Mot de passe invalide', context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            break;
          default:
            Toast.show(e.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        }
        //print(e.message);
        //Toast.show(e.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }
    }
  }

}