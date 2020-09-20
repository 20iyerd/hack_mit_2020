import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentUsers extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String school;
  final int grade;
  // final String subjects;
  // final int yrsExperience;
  // final <String>[] softSkills;
  final int timepreference;
  final bool matched;

  StudentUsers.fromMap(Map<String,dynamic> map,)
    : assert(map['firstname'] != null),
      assert(map['lastname'] != null),
      assert(map['school'] != null),
      assert(map['timepreference'] != null),
  //     assert(map['classsize'] != null),
      assert(map['grade'] != null),
      assert(map['matched'] != null),
  //     assert(map['skills'] != null),
  //     assert(map['subjects'] != null),
      firstname = map['firstname'],
      lastname = map['lastname'],
      grade = map['grade'],
      school = map['school'],
      timepreference = map['timepreference'],
      matched = map['matched'];

  StudentUsers.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StudentUsersBuilder();
  }

}

class TeacherUsers {
  // final String name

}

class StudentUsersBuilder extends StatelessWidget {
  // CollectionReference collectionReference =
  //   FirebaseFirestore.instance.collection("Student");
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      //organizes database data into a stream
        stream: FirebaseFirestore.instance.collection("Student").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            switch (snapshot
                .connectionState) { //this whole no connection thing is untested cause it always has connection for some reason
              case ConnectionState.waiting:
                return new LinearProgressIndicator();
              case ConnectionState.active:
                return
                    snapshot.data
                        .documents; //call to _buildList method which packages the data
              case ConnectionState.done:
                return
                    snapshot.data
                        .documents;//call to _buildList method which packages the data
              case ConnectionState.none:
                return new Text("No connection");
            }
            if (!snapshot.hasData)
              return LinearProgressIndicator(); //instead of throwing exception for lack of data, show progress bar
            //TODO: Untested
//          return _buildList(
//              context,
//              snapshot.data
//                  .documents); //call to _buildList method which packages the data
          }
          else {
            return Text("Loading");
          }
          return null;
        }
    );
//     return StreamBuilder(
//       //organizes database data into a stream
//         stream: FirebaseFirestore.instance.collection("Student").snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             print("snapshot has data");
//           }
//             return snapshot.data.documents; //placeholder
//           //
//           // }
//
//           // if(snapshot.hasData) {
//           //   switch (snapshot
//           //       .connectionState) { //this whole no connection thing is untested cause it always has connection for some reason
//           //     case ConnectionState.waiting:
//           //       return new LinearProgressIndicator();
//           //
//           //     case ConnectionState.active:
//           //       return snapshot.data.documents;
//           //   //     return _buildList(
//           //   //         context,
//           //   //         snapshot.data
//           //   //             .documents); //call to _buildList method which packages the data
//           //     case ConnectionState.done:
//           //       return snapshot.data.documents;
//           //   //     return _buildList(
//           //   //         context,
//           //   //         snapshot.data
//           //   //             .documents); //call to _buildList method which packages the data
//           //     case ConnectionState.none:
//           //       return new Text("No connection");
//           //   }
//           // }
//           //   if (!snapshot.hasData)
//           //     return LinearProgressIndicator(); //instead of throwing exception for lack of data, show progress bar
//             //TODO: Untested
// //          return _buildList(
// //              context,
// //              snapshot.data
// //                  .documents); //call to _buildList method which packages the data
// //           }
// //           else {
// //             return LinearProgressIndicator();
// //           }
// //           return null;
//         }
//     );

    // List<String> _buildList(BuildContext context,DocumentSnapshot snapshot){

    }
}