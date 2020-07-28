import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Challenge16 extends StatefulWidget {
  @override
  _Challenge16State createState() => _Challenge16State();
}

class _Challenge16State extends State<Challenge16 > {

  int currentNumber = Random().nextInt(100) + 1;
  int guessedNumber;
  int attemptsNumber = 0;
  String errorMsg = '';
  String result;


  //TODO: think of the challenge Extension
  void setGuessedNumber(String newValue){
    setState(() {
      errorMsg = '';
    });
    try {
      guessedNumber = int.parse(newValue);
    } on FormatException {
      setState(() {
        errorMsg = 'Please Enter Number';
      });
    }
  }

  void showResult(){
    setState(() {
      currentNumber = Random().nextInt(100) + 1;
    });
    if(guessedNumber == currentNumber){
      setState(() {
        result = 'Got it!\nAttempts Number: $attemptsNumber';
      });
    } else if (guessedNumber > currentNumber){
      setState(() {
        result = 'too high :(';
        attemptsNumber ++;
      });
    } else {
      setState(() {
        result = 'too low :(';
        attemptsNumber ++;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 16'),
      ),
      backgroundColor: Colors.blue.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            'Current Number : $currentNumber',
            style: TextStyle(
              color: Colors.blue.shade500,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          MyTextField(
            hint: 'Guess the number.',
            label: 'Number',
            myColor: Colors.blue.shade500,
            onChange: setGuessedNumber,
          ),
          Text(
            errorMsg,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          MyRaisedButton(
            text: 'Done',
            color: Colors.blue.shade500,
            onPressed: showResult,
          ),
          Text(
            result != null ? result : '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
