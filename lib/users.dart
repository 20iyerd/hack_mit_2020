import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentUsers {
  final String name;
  final String school;
  // final int grade;
  // final <String>[] subjects;
  // final int yrsExperience;
  // final <String>[] softSkills;
  // final <String>[] timePreferences;
  // final bool matched;

  StudentUsers.fromMap(Map<String,dynamic> map,)
    : assert(map['name'] != null),
      assert(map['school'] != null),
      name = map['name'],
      school = map['school'];

  StudentUsers.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data());

}

class TeacherUsers {
  // final String name

}

class StudentUsersBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      //organizes database data into a stream
        stream: FirebaseFirestore.instance.collection("Student").snapshots(),
        builder: (context, snapshot) {
          return Text('h');
          // if(snapshot.hasData) {
            // switch (snapshot
            //     .connectionState) { //this whole no connection thing is untested cause it always has connection for some reason
            //   case ConnectionState.waiting:
            //     return new LinearProgressIndicator();
            //   case ConnectionState.active:
            //     return _buildList(
            //         context,
            //         snapshot.data
            //             .documents); //call to _buildList method which packages the data
            //   case ConnectionState.done:
            //     return _buildList(
            //         context,
            //         snapshot.data
            //             .documents); //call to _buildList method which packages the data
            //   case ConnectionState.none:
            //     return new Text("No connection");
            // }
            // if (!snapshot.hasData)
            //   return LinearProgressIndicator(); //instead of throwing exception for lack of data, show progress bar
            //TODO: Untested
//          return _buildList(
//              context,
//              snapshot.data
//                  .documents); //call to _buildList method which packages the data
//           }
//           else {
//             return Text("Loading");
//           }
//           return null;
        }
    );

    // List<String> _buildList(BuildContext context,DocumentSnapshot snapshot){

    }
}