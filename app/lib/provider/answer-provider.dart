import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerProvider {
  List<List<int>> answers = [];

  void initAnswers(int length) {
    answers.clear();
    for (int i = 0; i < length; i++) {
      answers.add([]);
    }
  }

  void updateProvider(int questionIndex, bool isMultiChoice, int answerIndex) {
    if (isMultiChoice) {
      if (answers[questionIndex].isEmpty) {
        answers[questionIndex].add(answerIndex);
      } else {
       if( answers[questionIndex].contains(answerIndex)){
         answers[questionIndex].remove(answerIndex);
       }else{
         answers[questionIndex].add(answerIndex);
       }

      }

    } else {
      if (answers[questionIndex].isEmpty) {
        answers[questionIndex].add(answerIndex);
      } else {
        answers[questionIndex][0] = answerIndex;
      }
    }
  }
}
