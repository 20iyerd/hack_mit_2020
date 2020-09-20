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

  String _timeZone = '+0000';
  String _startTime = '';
  bool _startTimeAM = true;
  String _endTime = '';
  bool _endTimeAM = true;
  String _date = '2012-02-07';
  DateTime startDateTime;
  DateTime endDateTime;

  int _grade = 0;
  int _classSize = 0;
  List _subjectsList = [];
  String _subjects = '';
  List _skillsList = [];
  String _skills = '';
  int _experience = 0;
  int _hours = 0;


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
                  SizedBox(height: 24.0),
                  DropdownButton(
                      value: _classSize,
                      items: [
                        DropdownMenuItem(
                            child: Text('0-10'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('10-20'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('20-30'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('30+'),
                            value: 3
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _classSize = value;
                        });
                      }
                  ),

                  SizedBox(height: 24.0),
                  Text('Grade Taught'),

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
                                      value: '+0000GMT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("UTC"),
                                      value: '+0000UTC'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ECT"),
                                      value: '+0100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EET"),
                                      value: '+0200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ART"),
                                      value: '+0200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EAT"),
                                      value: '+0300'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MET"),
                                      value: '+0300MET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NET"),
                                      value: '+0400'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PLT"),
                                      value: '+0500'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IST"),
                                      value: '+0530'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BST"),
                                      value: '+0600'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("VST"),
                                      value: '+0700'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CTT"),
                                      value: '+0800'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("JST"),
                                      value: '+0900'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ACT"),
                                      value: '+0930'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AET"),
                                      value: '+1000'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("SST"),
                                      value: '+1100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NST"),
                                      value: '+1200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MIT"),
                                      value: '-1100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("HST"),
                                      value: '-1000'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AST"),
                                      value: '-0900'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PST"),
                                      value: '-0800'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PNT"),
                                      value: '-0700'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MST"),
                                      value: '0700MST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CST"),
                                      value: '-0600'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EST"),
                                      value: '-0500'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IET"),
                                      value: '-0500IET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PRT"),
                                      value: '-0400'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CNT"),
                                      value: '-0330'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AGT"),
                                      value: '-0300'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BET"),
                                      value: '-0300BET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CAT"),
                                      value: '-0100'
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
                            )

                          ]

                      )
                  ),

                  Form(
                    key: formKeySki,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16),
                          child: MultiSelectFormField(
                            autovalidate: false,
                            titleText: 'Important Skills',
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return 'Please select the skills you value the most';
                              }
                              return '';
                            },
                            dataSource: [
                              {
                                "display": "Leadership",
                                "value": "Leadership",
                              },
                              {
                                "display": "Communication",
                                "value": "Communication",
                              },
                              {
                                "display": "Time_Management",
                                "value": "Time_Management",
                              },
                              {
                                "display": "Creativity",
                                "value": "Creativity",
                              },
                              {
                                "display": "Empathy",
                                "value": "Empathy",
                              },
                              {
                                "display": "Teamwork",
                                "value": "Teamwork",
                              },
                              {
                                "display": "Reliability",
                                "value": "Reliability",
                              },
                              {
                                "display": "Initiative",
                                "value": "Initiative",
                              },
                              {
                                "display": "Confidence",
                                "value": "Confidence",
                              },
                              {
                                "display": "Integrity",
                                "value": "Integrity",
                              },
                              {
                                "display": "Enthusiasm",
                                "value": "Enthusiasm",
                              },
                              {
                                "display": "Flexibility",
                                "value": "Flexibility",
                              },{
                                "display": "Diligence",
                                "value": "Diligence",
                              },
                              {
                                "display": "Resourcefulness",
                                "value": "Resourcefulness",
                              },
                              {
                                "display": "Problem_Solving",
                                "value": "Problem_Solving",
                              }
                            ],
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            // required: true,
                            hintText: 'Please choose one or more',
                            //value: _skillsList,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _skillsList = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: RaisedButton(
                            child: Text('Save'),
                            onPressed: (){
                            _saveSkillsForm();}
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text('Preferred level of teaching experience from student volunteer'),
                  DropdownButton(
                      value: _experience,
                      items: [
                        DropdownMenuItem(
                            child: Text('No Preference'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('1 year'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('2 years'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('3 years'),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text('3+ years'),
                            value: 4
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _experience = value;
                        });
                      }
                  ),

                  Text('Typical hours for student volunteer to serve per week'),
                  DropdownButton(
                      value: _hours,
                      items: [
                        DropdownMenuItem(
                            child: Text('0-10 hours'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('10-20 hours'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('20-30 hours'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('30+ hours'),
                            value: 3
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _hours = value;
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

                        if (_startTime == '1200'){
                          _startTime = '0000';
                        }// noon
                        if (_endTime == '1200'){
                          _endTime = '0000';
                        }
                        if (_startTimeAM){
                          _startTime = (int.parse('_startTime') + 1200).toString();
                        }
                        if (_endTimeAM){
                          _endTime = (int.parse('_endTime')+1200).toString();
                        }
                        startDateTime = DateTime.parse(_date + " " + _startTime + " " + _timeZone.substring(1,6));
                        endDateTime = DateTime.parse(_date + " " + _startTime + " " + _timeZone.substring(1,6));
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

class Student1 extends StatefulWidget {
  @override
  _StudentState1 createState() => _StudentState1();
}


class _StudentState1 extends State<Student1> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _schoolController = TextEditingController();
  final formKeySub = new GlobalKey<FormState>();
  final formKeySki = new GlobalKey<FormState>();

  String _timeZone = '+0000';
  String _startTime = '';
  bool _startTimeAM = true;
  String _endTime = '';
  bool _endTimeAM = true;
  String _date = '2012-02-07';
  DateTime startDateTime;
  DateTime endDateTime;

  int _gradeMin = 0;
  int _gradeMax = 0;
  int _classSize = 0;
  List _subjectsList = [];
  String _subjects = '';
  List _skillsList = [];
  String _skills = '';
  int _experience = 0;
  int _hours = 0;
  bool _status = false;
  String _firstName = ''; // not sure how to get these
  String _lastName = '';

  // things to send to firebase bc they'll be used in algorithm
  String fullName; // _firstName + _lastName


  String _handleSubmitted(String selectedGroup, String name, String bio) {
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
  Widget build(BuildContext context){
    return Scaffold( // creates Scaffold
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Column(
                      children: <Widget>[
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
                  SizedBox(height: 24.0),
                  DropdownButton(
                      value: _classSize,
                      items: [
                        DropdownMenuItem(
                            child: Text('0-10'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('10-20'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('20-30'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('30+'),
                            value: 3
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _classSize = value;
                        });
                      }
                  ),

                  SizedBox(height: 24.0),
                  Text('Lowest preferred grade to teach'),

                  DropdownButton(
                      value: _gradeMin,
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
                          _gradeMin = value;
                        });
                      }
                  ),

            SizedBox(height: 24.0),
            Text('Highest preferred grade to teach'),
            DropdownButton(
                value: _gradeMax,
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
                    _gradeMax = value;
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
                                    titleText: 'Subjects you can teach',
                                    validator: (value) {
                                      if (value == null || value.length == 0) {
                                        return 'Please select all that apply';
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
                                      value: '+0000GMT'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("UTC"),
                                      value: '+0000UTC'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ECT"),
                                      value: '+0100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EET"),
                                      value: '+0200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ART"),
                                      value: '+0200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EAT"),
                                      value: '+0300'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MET"),
                                      value: '+0300MET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NET"),
                                      value: '+0400'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PLT"),
                                      value: '+0500'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IST"),
                                      value: '+0530'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BST"),
                                      value: '+0600'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("VST"),
                                      value: '+0700'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CTT"),
                                      value: '+0800'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("JST"),
                                      value: '+0900'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("ACT"),
                                      value: '+0930'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AET"),
                                      value: '+1000'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("SST"),
                                      value: '+1100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("NST"),
                                      value: '+1200'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MIT"),
                                      value: '-1100'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("HST"),
                                      value: '-1000'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AST"),
                                      value: '-0900'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PST"),
                                      value: '-0800'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PNT"),
                                      value: '-0700'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("MST"),
                                      value: '0700MST'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CST"),
                                      value: '-0600'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("EST"),
                                      value: '-0500'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("IET"),
                                      value: '-0500IET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("PRT"),
                                      value: '-0400'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CNT"),
                                      value: '-0330'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("AGT"),
                                      value: '-0300'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("BET"),
                                      value: '-0300BET'
                                  ),
                                  DropdownMenuItem(
                                      child: Text("CAT"),
                                      value: '-0100'
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _timeZone = value;
                                  });
                                }),

                            SizedBox(height: 12.0),
                            Text('Earliest preferred class start time'),
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
                            Text('Latest preferred class end time'),
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
                            )

                          ]

                      )
                  ),

                  Form(
                    key: formKeySki,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16),
                          child: MultiSelectFormField(
                            autovalidate: false,
                            titleText: 'Important Skills',
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return 'Skills you have mastered (select all that apply)';
                              }
                              return '';
                            },
                            dataSource: [
                              {
                                "display": "Leadership",
                                "value": "Leadership",
                              },
                              {
                                "display": "Communication",
                                "value": "Communication",
                              },
                              {
                                "display": "Time_Management",
                                "value": "Time_Management",
                              },
                              {
                                "display": "Creativity",
                                "value": "Creativity",
                              },
                              {
                                "display": "Empathy",
                                "value": "Empathy",
                              },
                              {
                                "display": "Teamwork",
                                "value": "Teamwork",
                              },
                              {
                                "display": "Reliability",
                                "value": "Reliability",
                              },
                              {
                                "display": "Initiative",
                                "value": "Initiative",
                              },
                              {
                                "display": "Confidence",
                                "value": "Confidence",
                              },
                              {
                                "display": "Integrity",
                                "value": "Integrity",
                              },
                              {
                                "display": "Enthusiasm",
                                "value": "Enthusiasm",
                              },
                              {
                                "display": "Flexibility",
                                "value": "Flexibility",
                              },{
                                "display": "diligence",
                                "value": "Diligence",
                              },
                              {
                                "display": "Resourcefulness",
                                "value": "Resourcefulness",
                              },
                              {
                                "display": "Problem_Solving",
                                "value": "Problem_Solving",
                              }
                            ],
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            // required: true,
                            hintText: 'Please choose one or more',
                            //value: _skillsList,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _skillsList = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: RaisedButton(
                              child: Text('Save'),
                              onPressed: (){
                                _saveSkillsForm();}
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text('Years of teaching experience'),
                  DropdownButton(
                      value: _experience,
                      items: [
                        DropdownMenuItem(
                            child: Text('No Preference'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('1 year'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('2 years'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('3 years'),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text('3+ years'),
                            value: 4
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _experience = value;
                        });
                      }
                  ),

                  SizedBox(height: 40.0),
                  Text('Average hours you can contribute per week'),
                  DropdownButton(
                      value: _hours,
                      items: [
                        DropdownMenuItem(
                            child: Text('0-10 hours'),
                            value: 0
                        ),
                        DropdownMenuItem(
                            child: Text('10-20 hours'),
                            value: 1
                        ),
                        DropdownMenuItem(
                            child: Text('20-30 hours'),
                            value: 2
                        ),
                        DropdownMenuItem(
                            child: Text('30+ hours'),
                            value: 3
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _hours = value;
                        });
                      }
                  ),

                  SizedBox(height: 24.0),
                  Text('Do you already have a job/volunteer position?'),
                  DropdownButton(
                      value: _status,
                      items: [
                        DropdownMenuItem(
                            child: Text('No'),
                            value: false
                        ),
                        DropdownMenuItem(
                            child: Text('Yes'),
                            value: true
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _status = value;
                        });
                      }
                  ),

                  RaisedButton( // I'm gonna do all my calculations here
                      color: Colors.blue,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_startTime == '1200'){
                          _startTime = '0000';
                        }// noon
                        if (_endTime == '1200'){
                          _endTime = '0000';
                        }
                        if (_startTimeAM){
                          _startTime = (int.parse('_startTime') + 1200).toString();
                        }
                        if (_endTimeAM){
                          _endTime = (int.parse('_endTime')+1200).toString();
                        }
                        startDateTime = DateTime.parse(_date + " " + _startTime + " " + _timeZone.substring(1,6));
                        endDateTime = DateTime.parse(_date + " " + _startTime + " " + _timeZone.substring(1,6));
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
    );
  }

}
