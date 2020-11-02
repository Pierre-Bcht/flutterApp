import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/cupertino.dart';
import 'main.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);


  @override
  MyLoginPageState createState() => MyLoginPageState();
}


class MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black

                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Connexion',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(color: Colors.grey),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Champ vide";
                                  }
                                  if (!value.contains("@")) {
                                    return "Email invalide";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                    icon: Icon(
                                      Icons.email, color: Colors.white,)
                                ),
                                onSaved: (input) => _email = input,
                              ),

                              TextFormField(
                                style: TextStyle(color: Colors.grey),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Champ vide";
                                  }
                                  if (value.length < 7) {
                                    return "Mot de passe trop court";
                                  }
                                },
                                decoration: InputDecoration(

                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                    icon: Icon(Icons.lock, color: Colors.white,)
                                ),
                                onSaved: (input) => _password = input,

                              ),


                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25.0),
                                width: double.infinity,
                                child: RaisedButton(
                                  elevation: 5.0,
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Colors.lightGreenAccent,
                                  onPressed: signIn,
                                  child: Text('LOGIN',
                                    style: TextStyle(
                                      color: Color(0xFF527DAA),
                                      letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),),
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///////////
  //CONNEXION -> ID : test@flutter.com / MDP : testtest
  ///////////

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}