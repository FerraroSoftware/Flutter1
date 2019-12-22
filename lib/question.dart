// Type 'st' to get quick classes

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // Using final is normal for Stateless widget as it wont update
  final String questionText;

  // Constructor, whatever passed in will be stored to data
  // member questionText. It is a position arugment, not named ({})
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Take full width of screen
      // Need this to get it actually center correctly 
      width: double.infinity,
      // Spacing around the container
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}