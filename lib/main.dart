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
  var _questionIndex = 0;

  // List will never change
  final _questions = const [
    // Creating map shorthand, Map alterative
    {
      'questionText': 'What\'s your favoite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Dog', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': ['Steak', 'Pizza', 'Pasta', 'Chicken']
    },
  ];

  void _answerQuestion() {
    // !!!Connection 3 :: using setState()
    // Calls the build() method again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more _questions!');
    }
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
            : Result()
      ),
    );
  }
}

// Lets create a new Widget called question in a new file
