import 'package:flutter/material.dart';
import 'package:intro_project/quiz.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

// void main() {

//   runApp(MyApp());
// }

void main() => runApp(MyApp());

// Look for the 3 conenctions for state updating -

class MyApp extends StatefulWidget {
  // !!!Connection 2
  // type createState() to auto populate
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Stateful widgets have 2 classes, name is same with 'State' added
// State is attached to widget and not recreated unlike MyApp()
// !!!Connection 1 :: extends State<MyApp>
// MyAppState == public
// _MyAppState == Can now only be used in this file where this class lives
class _MyAppState extends State<MyApp> {

  // List will never change
  // This list of maps is used across the widgets
  final _questions = const [
    // Creating map shorthand, Map alterative
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Steak', 'score': 10},
        {'text': 'Pizza', 'score': 4},
        {'text': 'Pasta', 'score': 2},
        {'text': 'Chicken', 'score': 5},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // Increment question index in map to go through list
  // When complete need to handle response
  void _answerQuestion(int score) {
    // !!!Connection 3 :: using setState()
    // Calls the build() method again
    
    // Update the score throughout quiz 
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  // Overriding build method of statelesswidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          // Create if else check to fix fall off at end
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result()),
    );
  }
}

// Lets create a new Widget called question in a new file
