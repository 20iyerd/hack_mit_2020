// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'backdrop.dart';

class CreateFirst extends StatelessWidget {
  //immutable widget which doesn't change state

  @override
  Widget build(BuildContext context) {
    //required method by stateless widgets as well

    return Backdrop(
      frontLayer: Center(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 300,
              ),
              Text(
                "Welcome, User!",
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              Icon(
                Icons.arrow_downward,
                size: 60,
                color: Colors.blueGrey[200],
              ),
              SizedBox(
                height: 800,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      "What's new:",
                      style: Theme.of(context).textTheme.headline,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "No new updates to show.",
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
                color: Colors.blueGrey[200],
              ),
              SizedBox(
                height: 800,
              )
            ],
          ),
        ),
      ),
      backLayer: Container(
        color: Colors.blueGrey[100],
      ),
      frontTitle: Text("Create an account here"),
      backTitle: Text("Welcome"),
    );
  }
}
