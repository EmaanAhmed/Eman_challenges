import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge7 extends StatefulWidget {
  @override
  _Challenge7State createState() => _Challenge7State();
}

class _Challenge7State extends State<Challenge7> {
  DateTime firstTime;
  DateTime secondTime;

  int difference;
  int highScore;

  bool isVisible = false;
  String alphabet = 'abcdefghijklmnopqrstuvwxyz';
  String userInput = '';
  String result = '';

  void setFirstTime() {
    firstTime = DateTime.now();
    setState(() {
      isVisible = true;
    });
  }

  void setUserInput(String input) {
    userInput = input;
  }

  void setSecondTime() {
    secondTime = DateTime.now();
    if (userInput.toLowerCase() == alphabet) {
      difference = secondTime.difference(firstTime).inSeconds;
      setState(() {
        result = 'You got this right, it took you $difference seconds';
      });
      if (highScore == null) {
        highScore = difference;
      } else if (difference < highScore) {
        highScore = difference;
      }
    } else {
      setState(() {
        result = 'you did\'nt type them right :(\nReverse and try again ;)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 7'),
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            'Wanna Know how quick you are at typing the alphabet?\nClick ready button when you\'re ready ;)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple.shade600,
              fontSize: 18.0,
            ),
          ),
          MyRaisedButton(
            color: Colors.deepPurple.shade600,
            text: 'I\'am Ready!',
            onPressed: setFirstTime,
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              children: <Widget>[
                MyTextField(
                  hint: 'Write Alphabet Then click Done',
                  label: 'Alphabet',
                  myColor: Colors.deepPurple.shade600,
                  onChange: setUserInput,
                ),
                MyRaisedButton(
                  text: 'Done',
                  color: Colors.deepPurple.shade600,
                  onPressed: setSecondTime,
                ),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  highScore != null ? 'High Score: $highScore' : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
