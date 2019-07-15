import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLogin extends StatefulWidget {

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  //String _email, _password;
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                          controller: emailController,
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
                        //labelText: "Password",
                        hintText: "Mot de passe",
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
                      onPressed: signIn,
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
                  onPressed: () {},
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
        print('Connecté');
        Navigator.pop(context);
      }catch(e){
        print(e.message);
      }
    }
  }

}