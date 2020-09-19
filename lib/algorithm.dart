// import 'dart:math';
//
// // factors of comparison
// var time;
// var hours;
// var subjects;
// var size;
// var grade;
// var skills;
// var experience;
// var status = false;
//
//
// // time zone comparison
// double timeZone(DateTime classBegin, DateTime classEnd, DateTime studentBegin, DateTime studentEnd){
//   classBegin = classBegin.toUtc();
//   classEnd = classEnd.toUtc();
//   studentBegin = studentBegin.toUtc();
//   studentEnd = studentEnd.toUtc();
//   if ((classBegin.isAfter(studentBegin)  || classBegin.isAtSameMomentAs(studentBegin))
//   && (classEnd.isBefore(studentEnd) || classEnd.isAtSameMomentAs(studentEnd))) time = 1;
//   else if ((classBegin.isAfter(studentBegin) || (classBegin.isAtSameMomentAs(studentBegin)))
//   && classEnd.isAfter(studentEnd)){
//   time = (24 - (classEnd.difference(studentEnd)).inHours) / 24;
//   }
//   else if (classBegin.isBefore(studentBegin) && classEnd.isBefore(studentEnd)){
//   time = (24 - (studentBegin.difference(classBegin)).inHours) / 24;
//   }
//   else{
//   time = (48- (studentBefore.difference).inHours);
//   }
//   return time;
// }