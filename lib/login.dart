import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(//organize into scaffold
      backgroundColor: Color(0xffa8d0e6),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 140.0),
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/logo.jpg"),
                  height:125,
                ),
                Text('BridgeGap',
                    style: GoogleFonts.frederickatheGreat(
                      textStyle: TextStyle(color: Color(0xff24305e), fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                ),
                    //0xff24305e is dark blue
              ],
            ),
            SizedBox(height: 50.0), //spacing for aesthetics
            TextField(
              //add a controller to authenticate and clear text
              controller: _usernameController,
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Username or Email:",
                labelStyle: TextStyle(color: const Color(0xff24305e)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff24305e)),
                )
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
                fillColor: Colors.white,
                filled: true,
                labelText: "Password:",
                labelStyle: TextStyle(color: Color(0xff24305e)),
              ),
            ),

            FlatButton(
              child: Text(
                "Create a new account",
                style: TextStyle(fontSize:18, color:Color(0xff374785), fontWeight: FontWeight.w600),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/signup');
              },
            ),

            SizedBox(height: 24.0),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                      "Cancel",
                  style: TextStyle(color: Color(0xff24305e))),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  color: Color(0xff24305e),
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
