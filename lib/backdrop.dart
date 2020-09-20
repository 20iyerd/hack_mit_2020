import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'users.dart';

class _BackdropState extends State<Backdrop> //added backdrop for added functionality, especially with layers
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop'); //label

  // TODO: Add AnimationController widget (104)

  // TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  Widget _buildStack() { //stack of back, front layers
    return Stack(
      key: _backdropKey,
      children: <Widget>[
        widget.backLayer,
        widget.frontLayer,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.dark, //make top status bar of phone icons appear white for contrast
      elevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: Color (0xfff76c6c),
      title: Text('Explore'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            
          },
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            semanticLabel: 'settings',
          ),
          onPressed: () {

          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: _buildStack(),
      drawer: Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          //child: Text('Menu'),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn.dribbble.com/users/1431602/screenshots/5020547/golden-gate.gif"), alignment:Alignment.topCenter,
                fit: BoxFit.cover),
            color: Colors.blue,
            )
          ),
        ListTile(
          title: Text('Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        ListTile(
          title: Text('Dashboard'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
        ListTile(
          title: Text('My Matches'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtherMatches()),
            );
          },
        ),
      ListTile(
        title: Text('Logout'),
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
       ),
      ],
    ),
   ),
  );
  }
}

class Backdrop extends StatefulWidget { //easy accessibility
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

class Profile extends StatefulWidget{

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DocumentSnapshot args = ModalRoute.of(context).settings.arguments;
    return _buildProfile(context, theme, args);
  }
  Widget _buildProfile(BuildContext context, ThemeData theme, DocumentSnapshot args){
      // final record = StudentUsers.fromSnapshot(args);
   // if(Users.fromSnapshot(args).longAbout != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Color(0xfff76c6c),
          ),
          // body contains name, subject, preferences, etc
          body: Center(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/teachers.jpg'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text(
                    "name",
                    // record.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Student',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                      height: 17.0
                  ),
                  Text(
                    'Time Preferences:',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert time preference',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Subjects:',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert subjects',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Class Size:',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert class size',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Grade: ',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert grade',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Skills:',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert skills',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Experience: ',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert experience',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Hours:',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'insert hours',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Text(
                    'Matched?',
                    style: TextStyle(
                      fontSize:17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'yes or no',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ]),
              )

    ),
    );

    }
  }
 // }
// Text(
//   Users
//       .fromSnapshot(args)
//       .firstName
//   style: TextStyle(
//   fontSize: 40.0,
//   color: Color.blue,
//   )

class Dashboard extends StatefulWidget{

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool student;
  @override
  Widget build(BuildContext context) {
    if (student == true){
      return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: Color(0xfff76c6c),
      ),
        body: Center(
          child: SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Status:",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Teachers Matched with:",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: Text(
                      "Teacher Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: Text(
                      "Teacher Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              )
          ),
//          body: Padding(
//              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
//              child: Text(
//                  "hi",
//                  style: TextStyle(
//                    fontSize: 20,
//              ),
//              )
//          )
          // body contains students matched with, classes
        ),
        // body contains status, teachers matched with
    );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("Teacher Dashboard"),
          backgroundColor: Color(0xfff76c6c),
        ),
        body: Center(
            child: SingleChildScrollView(

             child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Status:",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                  Text(
                      "Students Matched with:",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: Text(
                      "Student Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: Text(
                      "Student Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: Text(
                      "Student Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
              ],
            )
        ),
//          body: Padding(
//              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
//              child: Text(
//                  "hi",
//                  style: TextStyle(
//                    fontSize: 20,
//              ),
//              )
//          )
        // body contains students matched with, classes
    ),
      );
    }
  }
}

class OtherMatches extends StatefulWidget{

  @override
  _OtherMatchesState createState() => _OtherMatchesState();
}

class _OtherMatchesState extends State<OtherMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Requests'),
        backgroundColor: Color(0xfff76c6c),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          Container(
            height: 30,
            color: Colors.blue[100],
            child: Text(
              "Outgoing Requests:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            color: Colors.blue[100],
            child: Text(
              "Incoming Requests:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
          Container(
            height: 50,
            color: Colors.blue[50],
            child: const Center(child: Text('Name')),
          ),
        ],
      )
    );

  }
}