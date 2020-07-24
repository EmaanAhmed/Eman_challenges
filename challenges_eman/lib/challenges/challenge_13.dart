import 'dart:async';

import 'package:challenges_eman/reusable_widgets/my_drop_down.dart';
import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Challenge13 extends StatefulWidget {
  @override
  _Challenge13State createState() => _Challenge13State();
}

class _Challenge13State extends State<Challenge13> {
  int startingNumber;
  int userChoice = 1;
  int machineChoice;
  int numberLeft;
  String player = 'Your';
  String winner;
  bool isClickable = true;

  @override
  void initState() {
    super.initState();
    startingNumber = 20 + Random().nextInt(11);
    numberLeft = startingNumber;
  }

  void setUserChoice(int newValue) {
    setState(() {
      userChoice = newValue;
    });
  }

  void generateMachineChoice() {
    setState(() {
      numberLeft = numberLeft - userChoice;
      player = 'Machine';
      isClickable = false;
    });
    if (numberLeft <= 0) {
      if (player == 'Your') {
        setState(() {
          winner = 'You Win!';
          player = null;
        });
      } else {
        setState(() {
          winner = 'Hard luck next time ;)';
          player = null;
        });
      }
    } else if (mounted) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          machineChoice = Random().nextInt(3) + 1;
          numberLeft = numberLeft - machineChoice;
          player = 'Your';
          isClickable = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            'Staring Number : $startingNumber',
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'How many do you want to remove?',
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyDropDown<int>(
                value: userChoice,
                items: [1, 2, 3],
                color: Colors.teal.shade700,
                onChanged: setUserChoice,
              ),
            ],
          ),
          MyRaisedButton(
            text: 'Done',
            color: Colors.teal.shade700,
            onPressed: isClickable ? generateMachineChoice : null,
          ),
          Text(
            machineChoice != null ? 'Machine removes $machineChoice' : '',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            numberLeft != null ? '$numberLeft Left' : '',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            player != null
                ? player == 'Your'
                    ? 'Your turn'
                    : 'Machine Turn, wait till its yours ;)'
                : '',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold),
          ),
          Text(
            winner != null ? winner : '',
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
