import 'dart:core';

class Algorithm {
// factors of comparison
  double time = 0.5;
  double hours = 0.5;
  double subjects = 0.5;
  double size = 0.5;
  double grade = 0.5;
  double skills = 0.5;
  double experience = 0.5;
  double percentage;
  // default: student is not already claimed
  bool status = false;

  // time zone comparison score
  double timeZone(DateTime classBegin, DateTime classEnd, DateTime studentBegin,
      DateTime studentEnd) {
    classBegin = classBegin.toUtc();
    classEnd = classEnd.toUtc();
    studentBegin = studentBegin.toUtc();
    studentEnd = studentEnd.toUtc();

    //cases: class is within/equal to student time, class starts before, class ends after, class starts before AND ends after
    if ((classBegin.isAfter(studentBegin) ||
        classBegin.isAtSameMomentAs(studentBegin))
        && (classEnd.isBefore(studentEnd) ||
            classEnd.isAtSameMomentAs(studentEnd))) {
      time = 1.0;
    }
    else if ((classBegin.isAfter(studentBegin) ||
        (classBegin.isAtSameMomentAs(studentBegin)))
        && classEnd.isAfter(studentEnd)) {
      time = (24.0 - ((classEnd
          .difference(studentEnd).inMinutes.toDouble())/60.0) / 24.0);
    }
    else if (classBegin.isBefore(studentBegin) &&
        (classEnd.isBefore(studentEnd) ||
            classEnd.isAtSameMomentAs(studentEnd))) {
      time = (24.0 - ((studentBegin
          .difference(classBegin)
          .inMinutes.toDouble())/60.0)/24.0);
    }
    else {
      time = (24.0 - ((studentBegin
          .difference(classBegin)
          .inMinutes.toDouble())/60.0) - (classEnd
          .difference(studentEnd)
          .inMinutes.toDouble())/60.0) / 24.0;
    }
    return time;
  }

  // subjects match extent score (proportion of teacher's subjects filled by student)
  // when selecting subjects, should add subject String to list
  double subjectsMatch(List<String> teacherSubjects, List<String> studentSubjects){
    double numPairs = 0;
    for (int i = 0; i < teacherSubjects.length; i++){
      for(int j = 0; j < studentSubjects.length; j++){
        if (teacherSubjects[i] == studentSubjects[j]){
          numPairs++;
        }
      }
    }
    subjects = numPairs/(teacherSubjects.length.toDouble());
    return subjects;
  }

  // class size match score
  double sizeMatch(int teacherClassSize, int studentPreference){
    size = (3.0 - (teacherClassSize.toDouble() - studentPreference.toDouble()).abs())/3.0;
    return size;
  }

  // grade match score
  //
  double gradeMatch(int teacherGrade, int studentMinGrade, int studentMaxGrade){
    if ((teacherGrade >= studentMinGrade) && (teacherGrade <= studentMaxGrade)){
      grade = 1.0;
    }
    else if (teacherGrade > studentMaxGrade){
      grade = (12.0 - teacherGrade + studentMaxGrade)/12.0;
    }
    else{
      grade = (12.0 - studentMinGrade + teacherGrade)/12.0;
    }
    return grade;
  }

  // skills match
  double skillsMatch(List<String> teacherSkills, List<String> studentSkills){
    double numPairs = 0;
    for (int i = 0; i < teacherSkills.length; i++){
      for (int j = 0; j < studentSkills.length; j++){
        if (teacherSkills[i] == studentSkills[j]){
          numPairs++;
        }
      }
    }
    skills = numPairs/(teacherSkills.length.toDouble());
    return skills;
  }

  // experience match
  // experience levels: no preference, none, 1-2, 3-4, 4+ scored 0, 1, 2, 3, 4
  double experienceMatch(int teacherPreference, int studentExperience){
    if (teacherPreference == 0 || (studentExperience >= teacherPreference)) {
      experience = 1.0;
    }
    else {
      experience = (teacherPreference.toDouble() - studentExperience.toDouble())/teacherPreference.toDouble();
    }
    return experience;
  }

  // hours student has available matched to hours in classroom required
  // hours options: 0-10, 10-20, 20-30, 30+ scored 0, 1, 2, 3 respectively
  double hoursMatch(int teacherHours, int studentHours){
    hours = (3.0 - (teacherHours.toDouble() - studentHours.toDouble()).abs())/3.0;
    return hours;
  }

  // toggles student's taken status
  bool changeStatus(){
    status = !status;
    return status;
  }

  // calculates final percentage match (weighted)
  double percentMatch(){
    percentage = 0.18 * time + 0.3 * subjects + 0.07 * size + 0.07 * grade + 0.1 * skills + 0.1 * experience + 0.18 * hours;
    if (status) {
      percentage = percentage/1.5;
    }
    return percentage;
  }

}
