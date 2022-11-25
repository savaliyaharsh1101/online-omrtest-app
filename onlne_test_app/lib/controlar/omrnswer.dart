import 'dart:core';

import '../modale/answermodle.dart';

// this is list for omr answer

class OmrSheetAnswer{
  List<Answer> answerList = [];

  void addanswer(int stateOfQustion,int selectedOption){
    answerList.add(Answer(stateOfQustion:stateOfQustion,selectedOption: selectedOption));
  }

  int fatchanswer(int questionNo){
    return answerList[questionNo].selectedOption!;
  }

}


