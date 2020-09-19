// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _schoolController = TextEditingController();
  final _pwController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> _handleSignIn(
      TextEditingController u, TextEditingController p) async {
    final UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: u.text,
      password: p.text,
    );
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //organize into scaffold
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/earth.png'), //display custom logo
                SizedBox(height: 16.0), //spacing for aesthetics
                Text('Create a new account'),
              ],
            ),

            SizedBox(height: 120.0), //spacing for aesthetics

            RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Teacher",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Teacher()),
                  );
                }
            ),

            RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Gap-Year Student",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Student()),
                  );
                }
            )

          ],
        ),
      ),
    );
  }
}


class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> _handleSignIn(
      TextEditingController u, TextEditingController p) async {
    final UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: u.text,
      password: p.text,
    );
    return user;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold( // creates Scaffold
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget> [
                  SizedBox(height: 80.0),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/earth.png'), //display custom logo
                      SizedBox(height: 16.0), //spacing for aesthetics
                      Text('Create a new account'),
                    ],
                  ),
                  SizedBox(height: 120.0), //spacing for aesthetics
                  TextField(
                    //add a controller to authenticate and clear text
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Email:",
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),

                  TextField(
                    controller: _passwordController,
                    //add a controller to authenticate and clear text
                    obscureText: true, //make sure password isn't visible
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Password:",
                    ),
                  ),

                  SizedBox(height: 24.0),

                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: () {
                          _emailController.clear();
                          _passwordController.clear();
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_emailController.text.length != 0 && //TODO: implement auth
                              _passwordController.text.length != 0) {
                            _handleSignIn(_emailController/*_usernameController*/, _passwordController/*_passwordController*/)
                                .then((UserCredential user) => print(user))
                                .catchError((e) => print(e));
                            Navigator.pushNamed(context, '/home'
                            );
                          }
                        },
                      )
                    ],
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Go Back",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  )
                ]
            )
        )
    );
  }
}

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold( // creates Scaffold
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget> [
                  SizedBox(height: 80.0),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/earth.png'), //display custom logo
                      SizedBox(height: 16.0), //spacing for aesthetics
                      Text('Create a new account'),
                    ],
                  ),
                  SizedBox(height: 120.0), //spacing for aesthetics
                  TextField(
                    //add a controller to authenticate and clear text
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Email:",
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),

                  TextField(
                    controller: _passwordController,
                    //add a controller to authenticate and clear text
                    obscureText: true, //make sure password isn't visible
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Password:",
                    ),
                  ),

                  SizedBox(height: 24.0),

                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: () {
                          _emailController.clear();
                          _passwordController.clear();
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_emailController.text.length != 0 && //TODO: implement auth
                              _passwordController.text.length != 0) {
                            Navigator.pushNamed(context, '/home'
                            );
                          }
                        },
                      )
                    ],
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Go Back",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  )
                ]
            )
        )
    );
  }
}

