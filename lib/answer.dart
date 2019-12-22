import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // Value is function
  final Function selectHandler;

  // _answerQuestion() callback passed to constructor as pointer 
  // and stored as selectHandler declared to be static function
  Answer(this.selectHandler);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        // Static property - Colors.blue
        // No need to create instance of class Colors
        color: Colors.blue,
        child: Text('Answer 1'),
        onPressed: selectHandler,
      ),
    );
  }
}