import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'backdrop.dart';

class HomePage extends StatelessWidget {
  //immutable widget which doesn't change state

  @override
  Widget build(BuildContext context) {
    //required method by stateless widgets as well

    return Backdrop(
      frontLayer: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 280,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: Text('Welcome to BridgeGap!',
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.center),
            ),
            // Text(
            //   "Welcome to BridgeGap!",
            //   style: Theme.of(context).textTheme.display1,
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(90,0,90,0),
              child:RaisedButton(
                color: Colors.green,
                child: Text(
                  "Get Matched",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  var arr = [1, 2, 3, 4, 5];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Matches()),
                  );
                },
              ),
            ),
          ],
        ),
        // CustomScrollView(
//          slivers: <Widget>[
//            SliverAppBar(
//              expandedHeight: 200,
//              flexibleSpace: const FlexibleSpaceBar(
//                title: Text(
//                  "Welcome, User!",
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              actions: <Widget>[
//              ],
//              pinned: false,
//              floating: false,
//              snap: false,
//            ),
//          ],
//        ),
//    ============================================================================

      ),
      backLayer: Container(
        color: Colors.blueGrey[100],
      ),
      frontTitle: Text("Home"),
      backTitle: Text("Welcome"),
    );
  }
}

class MatchPairs {
  MatchPairs(arr){
    for (int i = arr.length; i>0; i--) {
      print (i);
    }

  }
}

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Card(
          child: Container(
            height: 600,
            width: 350,
            /*child: SizedBox(
              height: 500,
              child: Text(

              ),

            ),*/
          )
        )
      ],
    );
  }
}