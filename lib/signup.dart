import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';



class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {

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
                Text('Create a new account')
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
                      labelText: "Email",
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
                      labelText: "Password (at least 6 characters)",
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
                    ],
                  ),

                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _handleSignIn(_emailController, _passwordController).then((UserCredential user) => print(user))
                            .catchError((e) => print(e));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Teacher1()),
                        );
                      }
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

class Teacher1 extends StatefulWidget {
  @override
  _TeacherState1 createState() => _TeacherState1();
}

class _TeacherState1 extends State<Teacher1> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _schoolController = TextEditingController();
  final formKeySub = new GlobalKey<FormState>();
  final formKeySki = new GlobalKey<FormState>();

  String _timeZone = 'UTC';
  String _startTime = '2012-02-27 00:00:00';
  bool _startTimeAM = true;
  String _endTime = '2012-02-27 00:00:00';
  bool _endTimeAM = true;
  double _classDuration = 0; // in minutes
  int _grade = 0;
  List _subjectsList = [];
  String _subjects = '';
  List _skillsList = [];
  String _skills = '';



  String _handleSubmitted(String selectedGroup, String name, String bio) {
    print(selectedGroup);
    print(name.split(" ").removeLast());
    FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection(selectedGroup)
        .doc(name.split(" ").removeLast())
        .set({
      'name': name,
      'bio': bio,
    });
    return name.split(" ").removeLast();
  }

  _saveSubjectsForm() {
    var form = formKeySub.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _subjects = _subjectsList.toString();
      });
    }
  }

  _saveSkillsForm(){
    var form = formKeySki.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _subjects = _subjectsList.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // creates Scaffold
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Column(
                      children: <Widget>[
                        Image.asset('assets/earth.png'),
                        SizedBox(height: 16.0),
                        Text('Create a new account')
                      ]
                  ),

                  TextField(
                    controller: _firstNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "First Name",
                    ),
                  ),

                  TextField(
                    controller: _lastNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Last Name",
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
                    ],
                  ),


                  SizedBox(height: 24.0),
                  TextField(
                    controller: _schoolController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "School Name",
                    ),
                  ),

                  SizedBox(height: 24.0),

                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: () {
                          _schoolController.clear();
                        },
                      ),
                    ],
                  ),

                  DropdownButton(
                      value: _grade,
                      items: [
                        DropdownMenuItem(
                            child: Text('K'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('1'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('2'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('3'),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text('4'),
                            value: 4
                        ),
                        DropdownMenuItem(
                            child: Text('5'),
                            value: 5
                        ),
                        DropdownMenuItem(
                            child: Text('6'),
                            value: 6
                        ),
                        DropdownMenuItem(
                            child: Text('7'),
                            value: 7
                        ),
                        DropdownMenuItem(
                            child: Text('8'),
                            value: 8
                        ),
                        DropdownMenuItem(
                            child: Text('9'),
                            value: 9
                        ),
                        DropdownMenuItem(
                            child: Text('10'),
                            value: 10
                        ),
                        DropdownMenuItem(
                            child: Text('11'),
                            value: 11
                        ),
                        DropdownMenuItem(
                            child: Text('12'),
                            value: 12
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _grade = value;
                        });
                      }
                  ),
                  SizedBox(height: 24.0),

                  Form(
                      key: formKeySub,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(16),
                                child: MultiSelectFormField(
                                    autovalidate: false,
                                    titleText: 'My workouts',
                                    validator: (value) {
                                      if (value == null || value.length == 0) {
                                        return 'Please select one or more options';
                                      }
                                      return '';
                                    },
                                    dataSource: [
                                      {
                                        "display": "Science",
                                        "value": "Science"
                                      },
                                      {
                                        "display": "Math",
                                        "value": "Math"
                                      },
                                      {
                                        "display": "English/Language_Arts",
                                        "value": "English/Language_Arts"
                                      },
                                      {
                                        "display": "Social_Studies",
                                        "value": "Social_studies"
                                      },
                                      {
                                        "display": "Physical_Education",
                                        "value": "Physical_Education"
                                      },
                                      {
                                        "display": "Visual_Arts",
                                        "value": "Visual_Arts"
                                      },
                                      {
                                        "display": "Music",
                                        "value": "Music"
                                      }
                                    ],
                                    textField: 'display',
                                    valueField: 'value',
                                    okButtonLabel: 'OK',
                                    cancelButtonLabel: 'CANCEL',
                                    hintText: 'Please select all that apply',
                                    //value: _subjectsList,
                                    onSaved: (value) {
                                      if (value == null) return;
                                      setState(() {
                                        _subjectsList = value;
                                      });
                                      print(_subjectsList);
                                    }
                                )
                            ),

                            Container(
                                padding: EdgeInsets.all(8),
                                child: RaisedButton(
                                    color: Colors.blue,
                                    child: Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _saveSubjectsForm();
                                    }
                                )
                            ),

                            SizedBox(height: 40.0),


                            Text('Choose time zone'),
                            SizedBox(height: 20.0),

                            DropdownButton( // choose from any time zone
                                value: _timeZone,
                                items: [
                                  DropdownMenuItem(
                                      child: Text("GMT"),
                                      value: 'GMT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("UTC"),
                                      value: 'UTC'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ECT"),
                                      value: 'ECT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EET"),
                                      value: 'EET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ART"),
                                      value: 'ART'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EAT"),
                                      value: 'EAT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MET"),
                                      value: 'MET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NET"),
                                      value: 'NET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PLT"),
                                      value: 'PLT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IST"),
                                      value: 'IST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BST"),
                                      value: 'BST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("VST"),
                                      value: 'VST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CTT"),
                                      value: 'CTT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("JST"),
                                      value: 'JST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ACT"),
                                      value: 'ACT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AET"),
                                      value: 'AET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("SST"),
                                      value: 'SST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NST"),
                                      value: 'NST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MIT"),
                                      value: 'MIT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("HST"),
                                      value: 'HST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AST"),
                                      value: 'AST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PST"),
                                      value: 'PST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PNT"),
                                      value: 'PNT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MST"),
                                      value: 'MST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CST"),
                                      value: 'CST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EST"),
                                      value: 'EST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IET"),
                                      value: 'IET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PRT"),
                                      value: 'PRT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CNT"),
                                      value: 'CNT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AGT"),
                                      value: 'AGT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BET"),
                                      value: 'BET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CAT"),
                                      value: 'CAT'
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _timeZone = value;
                                  });
                                }),

                            SizedBox(height: 12.0),
                            Text('Enter class start time'),
                            SizedBox(height: 20.0),

                            Column(
                                children: <Widget>[
                                  TextField(
                                    controller: _startTimeController,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      labelText: "Class Start Time (hh:mm format)",
                                    ),
                                  ),
                                  ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text("Clear"),
                                        onPressed: () {
                                          _startTimeController.clear();
                                        },
                                      ),
                                    ],
                                  )

                                ]
                            ),
                            DropdownButton(
                                value: _startTimeAM,
                                items: [
                                  DropdownMenuItem(
                                      child: Text('AM'),
                                      value: true
                                  ),
                                  DropdownMenuItem(
                                      child: Text('PM'),
                                      value: false
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _startTimeAM = value;
                                  });
                                }
                            ),
                            SizedBox(height: 20.0),
                            Text('Enter class end time'),
                            SizedBox(height: 20.0),

                            Column(
                                children: <Widget>[
                                  TextField(
                                    controller: _endTimeController,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      labelText: "Class End Time (hh:mm format)",
                                    ),
                                  ),
                                  ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text("Clear"),
                                        onPressed: () {
                                          _endTimeController.clear();
                                        },
                                      ),
                                    ],
                                  )

                                ]
                            ),
                            DropdownButton(
                                value: _endTimeAM,
                                items: [
                                  DropdownMenuItem(
                                      child: Text('AM'),
                                      value: true
                                  ),
                                  DropdownMenuItem(
                                      child: Text('PM'),
                                      value: false
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _endTimeAM = value;
                                  });
                                }
                            ),

                            RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/home');
                                }
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
                      labelText: "Email",
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
                      labelText: "Password (at least 6 characters)",
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
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_emailController.text.length != 0 && //TODO: implement auth
                              _passwordController.text.length != 0) {
                            _handleSignIn(_emailController, _passwordController).then((UserCredential user) => print(user))
                                .catchError((e) => print(e));
                            Navigator.pushNamed(context, '/home');
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

