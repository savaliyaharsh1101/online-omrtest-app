// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// modle for question

class Question {
  int? qustionNo ;
  String? textOfQuston ;
  int? correctAnswer;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? stateOfQustion;
  int? selectedOption;

  Question(
      {required String textOfQuston,
      required int qustionNo,
      required int correctAnswer,
      required String option1,
      required String option2,
      required String option3,
      required String option4,
      required int stateOfQustion,
      required int selectedOption}
      );
}
