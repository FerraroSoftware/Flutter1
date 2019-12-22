import 'package:flutter/material.dart';
import './question.dart';

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
      'What\'s your favoite color?',
      'What\'s your favorite animal?',
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
                questions[_questionIndex],
              ),
              RaisedButton(
                child: Text('Answer 1'),
                // Passing a pointer to flutter to the function to execute
                // calling answerQuestion() gives the result of the function at execution which is void
                // which is garbage.
                onPressed: _answerQuestion,
              ),
              RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print('Answer 2'),
              ),
              RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  print('Answer 3 Chosen');
                },
              ),
            ],
          )),
    );
  }
}

// Lets create a new Widget called question in a new file 