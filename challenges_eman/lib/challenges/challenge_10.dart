import 'dart:async';

import 'package:challenges_eman/reusable_widgets/my_drop_down.dart';
import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum Type {
  Rock,
  Scissors,
  Paper,
}

class Challenge10 extends StatefulWidget {
  @override
  _Challenge10State createState() => _Challenge10State();
}

class _Challenge10State extends State<Challenge10> {
  Type dropDownValue = Type.Rock;
  Type computerValue;
  String result = '';
  bool isButtonDisabled = false;
  int userScore = 0;
  int machineScore = 0;

  void setUserValue(Type newValue) {
    setState(() {
      dropDownValue = newValue;
    });
  }

  void setResult(String input) {
    setState(() {
      result = input;
    });
  }

  void play() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          computerValue = Type.values[Random().nextInt(3)];
        });
        if (dropDownValue.index == computerValue.index) {
          setResult('That\'s a Tie! Try Again');
        } else if (computerValue == Type.Rock && dropDownValue == Type.Paper) {
          setResult('You Won, YaaaaY ^_^');
          setState(() {
            userScore++;
          });
        } else if (dropDownValue == Type.Rock && computerValue == Type.Paper) {
          setResult('Hard Luck Next Time ;)');
          setState(() {
            machineScore++;
          });
        } else if (computerValue.index < dropDownValue.index) {
          setResult('Hard Luck Next Time ;)');
          setState(() {
            machineScore++;
          });
        } else {
          setResult('You Won, YaaaaY ^_^');
          setState(() {
            userScore++;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Choose Rock,Paper or Scissors',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.deepPurple.shade900,
            ),
          ),
          MyDropDown<Type>(
            value: dropDownValue,
            onChanged: setUserValue,
            items: Type.values,
            color: Colors.deepPurple.shade900,
          ),
          Text(
            computerValue != null
                ? 'Machine Selection: ${computerValue.toString().split('.').last}'
                : '',
            style: TextStyle(
              color: Colors.deepPurple.shade900,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 250.0,
            child: MyRaisedButton(
              text: 'Generate every 5 Seconds',
              color: Colors.deepPurple.shade900,
              onPressed: isButtonDisabled ? null : play,
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Your Score\n$userScore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Machine Score\n$machineScore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
