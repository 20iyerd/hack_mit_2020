// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'backdrop.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  //immutable widget which doesn't change state

  @override
  Widget build(BuildContext context) {
    //required method by stateless widgets as well

    return Backdrop(
      frontLayer: Center(
        //   child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Image(
              image: AssetImage("assets/logo.jpg"),
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to ',
                  style: GoogleFonts.indieFlower(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff24305e),
                          fontSize: 45.0)),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'BridgeGap',
                      style: GoogleFonts.frederickatheGreat(
                          textStyle: TextStyle(
                              color: Color(0xff24305e),
                              fontSize: 60,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            // Text(
            //   "Welcome to BridgeGap!",
            //   style: Theme.of(context).textTheme.display1,
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: RaisedButton(
                color: Color (0xfff8e9a1),
                padding: const EdgeInsets.fromLTRB(15,10,15,10),
                child: Text(
                  'GET MATCHED',
                  style: GoogleFonts.kosugi(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                          color: Color(0xfff76c6c),
                          fontSize: 25.0, letterSpacing:1.1)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Matches()),
                  );
                },
              ),
            ),
            // RaisedButton(
            //   color: Colors.green,
            //   child: Text(
            //     "Get Matched",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Matches()),
            //     );
            //   },
            // ),
          ],
        ),
        //),
      ),
      backLayer: Container(
        color: Color(0xffa8d0e6),
      ),
      frontTitle: Text("Home"),
      backTitle: Text("Welcome"),
    );
  }
}

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  //String profile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding:
              new EdgeInsets.fromLTRB(30.0, 0, 10, 0), //creates weird padding
          width: 350,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: 'Time Preferences: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert time preferences',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Subjects: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert subjects',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Class Size: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert class size',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Grade: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert grade',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Skills: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert skills',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Experience: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert experience',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Hours: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'insert hours',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Matched? ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'yes or no',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 35),
              ButtonBar(
                children: <Widget>[
                  FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () {
                      print("no button pressed");
                    },
                    label: Text("no"),
                    icon: Icon(Icons.thumb_down),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () {
                      print("yes button pressed");
                    },
                    label: Text("yes"),
                    icon: Icon(Icons.thumb_up),
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton.extended(
// onPressed:(){
// //add your onPressed code here!
// },
// label: Text('Yes'),
// icon: Icon(Icons.thumb_up),
// backgroundColor: Colors.blue,
// ),

// class _MatchesState extends State<Matches> {
//   //String profile;
//   @override
//   Widget build(BuildContext context){
//     return Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         Card(
//           child: Container(
//             height: 600,
//             width: 350,
//             child: SizedBox(
//               height: 100,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'backdrop.dart';
//
// class HomePage extends StatelessWidget {
//   //immutable widget which doesn't change state
//
//   @override
//   Widget build(BuildContext context) {
//     //required method by stateless widgets as well
//
//     return Backdrop(
//       frontLayer: Center(
//         // CustomScrollView(
// //          slivers: <Widget>[
// //            SliverAppBar(
// //              expandedHeight: 200,
// //              flexibleSpace: const FlexibleSpaceBar(
// //                title: Text(
// //                  "Welcome, User!",
// //                  textAlign: TextAlign.center,
// //                ),
// //              ),
// //              actions: <Widget>[
// //              ],
// //              pinned: false,
// //              floating: false,
// //              snap: false,
// //            ),
// //          ],
// //        ),
// //    ============================================================================ gradient button fail
// //         child: SingleChildScrollView(
// //           child: Column(
// //             mainAxisSize: MainAxisSize.max,
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: <Widget>[
// //               Padding(
// //                 padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
// //                 child: Text('Welcome to BridgeGap!',
// //                     style: TextStyle(fontSize:30),    //EDIT THIS LATER!!!!!
// //                     textAlign: TextAlign.center),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               // SizedBox(height: 30),
// //               RaisedButton(
// //                 color: Color(0xffa8d0e6),
// //                 highlightColor: Color(0xffa8d0e6),
// //                 textColor: Color(0xfff76c6c),
// //                 padding: EdgeInsets.fromLTRB(10,10,10,20),
// //
// //                 child: Container(
// //                   decoration: const BoxDecoration(
// //                     color:Color(0xffa8d0e6),
// //                     gradient: LinearGradient(
// //                       colors: <Color>[
// //                         Color(0xfff8e9a1),
// //                         Color(0xffa8d0e6),
// //                       ],
// //                     ),
// //                   ),
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: const Text('Get Matching',
// //                       style: TextStyle(fontSize:20)),
// //                 ),
// //                 onPressed: () {
// //                   Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => Matches())
// //                   );
// //                 },
// //               ),
//
//
//               Padding(
//                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                 child: RaisedButton(
//                   color: Color(0xfff8e9a1),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: <Color>[
//                           Color(0xfff8e9a1),
//                           Color(0xff374785),
//                         ],
//                       ),
//                     ),
//                     child: const Text(
//                       'Gradient Button', style: TextStyle(fontSize:16)
//                     ),
//                   // child: Text(
//                   //   "GET MATCHED",
//                   //   style: TextStyle(color: Color(0xfff76c6c), fontWeight:FontWeight.w700, fontSize:16),
//                   // ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Matches()),
//                     );
//                   },
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.green,
//                 child: Text(
//                   "Get Matched",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Matches()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       backLayer: Container(
//         color: Color(0xffa8d0e6),
//       ),
//       frontTitle: Text("Home"),
//       backTitle: Text("Welcome"),
//     );
//   }
// }
