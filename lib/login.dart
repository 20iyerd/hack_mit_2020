import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


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
                Text('Login'),
              ],
            ),
            SizedBox(height: 120.0), //spacing for aesthetics
            TextField(
              //add a controller to authenticate and clear text
              controller: _usernameController,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                labelText: "Username or Email:",
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

            FlatButton(
              child: Text(
                "Create a new account",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/signup');
              },
            ),

            SizedBox(height: 24.0),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    _usernameController.clear();
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
                    if (_usernameController.text.length != 0 && //TODO: implement auth
                        _passwordController.text.length != 0) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
