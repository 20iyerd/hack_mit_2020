// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _schoolController = TextEditingController();
  final _pwController = TextEditingController();

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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
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
              controller: _firstNameController,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                labelText: "First Name:",
              ),
            ),

            SizedBox(
              height: 12.0,
            ),

            TextField(
              controller: _lastNameController,
              //add a controller to authenticate and clear text
              obscureText: true, //make sure password isn't visible
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                labelText: "Last Name:",
              ),
            ),

            SizedBox(height: 24.0),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Clear"),
                  onPressed: () {
                    _firstNameController.clear();
                    _lastNameController.clear();
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_firstNameController.text.length != 0 && //TODO: implement auth
                        _lastNameController.text.length != 0) {
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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
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
                    controller: _firstNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "First Name:",
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),

                  TextField(
                    controller: _lastNameController,
                    //add a controller to authenticate and clear text
                    obscureText: true, //make sure password isn't visible
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Last Name:",
                    ),
                  ),

                  SizedBox(height: 24.0),

                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: () {
                          _firstNameController.clear();
                          _lastNameController.clear();
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_firstNameController.text.length != 0 && //TODO: implement auth
                              _lastNameController.text.length != 0) {
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

