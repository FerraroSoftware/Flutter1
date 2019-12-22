import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
      @required this.questions, 
      @required this.answerQuestion, 
      @required this.questionIndex
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //!!! Use custom Question widget here
        // Takes in String
        Question(
          // Access map 0, 1, 2
          // Then key 'questionText'
          questions[questionIndex]['questionText'],
        ),

        // Applies to every element in the map
        // Need to tell map as List of strings, doesn't beleive me
        // ... == spreadoperator
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          // Get the address of answerQuestion and forward to Answer
          // Anoynmous function
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
