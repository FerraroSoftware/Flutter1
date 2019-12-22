import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    // !!!Connection 3 :: using setState()
    // Calls the build() method again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  // Overriding build method of statelesswidget
  @override
  Widget build(BuildContext context) {
    var questions = [
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: Column(
          children: [
            //!!! Use custom Question widget here
            // Takes in String
            Question(
              // Access map 0, 1, 2
              // Then key 'questionText' 
              questions[_questionIndex]['questionText'],
            ),
            
            // Applies to every element in the map
            // Need to tell map as List of strings, doesn't beleive me 
            // ... == spreadoperator
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()

          ],
        ),
      ),
    );
  }
}

// Lets create a new Widget called question in a new file
