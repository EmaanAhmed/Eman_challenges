import 'dart:async';

import 'package:challenges_eman/reusable_widgets/my_drop_down.dart';
import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Guess {
  H,
  L,
}

class Challenge14 extends StatefulWidget {
  @override
  _Challenge14State createState() => _Challenge14State();
}

class _Challenge14State extends State<Challenge14> {
  int currentNumber = Random().nextInt(13) + 1;
  int nextNumber;
  Guess initialValue = Guess.H;
  bool isClickable = true;
  String player = 'Your';
  String result;
  int guesses = 10;
  int livesNumber = 2;

  void setDropDownValue(Guess newValue) {
    setState(() {
      initialValue = newValue;
    });
  }

  void generateNextNumber() {
    setState(() {
      player = 'Machine';
      isClickable = false;
      guesses = guesses - 1;
      result = '';
    });
    if (guesses >= 0) {
      if (mounted) {
        Timer(Duration(seconds: 2), () {
          setState(() {
            nextNumber = Random().nextInt(13) + 1;
            isClickable = guesses == 0 ? false : true;
          });
          if (initialValue == Guess.H) {
            if (nextNumber < currentNumber) {
              setState(() {
                result = 'You lose';
                player = null;
                isClickable = false;
                livesNumber--;
              });
              if (livesNumber > 0) {
                setState(() {
                  currentNumber = Random().nextInt(13) + 1;
                  nextNumber = null;
                  isClickable = true;
                  player = 'Your';
                  result = 'You lose, Play Again ;)';
                  guesses = 10;
                });
              }
            } else {
              setState(() {
                player = 'Your';
                currentNumber = nextNumber;
              });
              if (guesses == 0) {
                player = null;
                result = 'You win!';
              }
            }
          } else {
            if (nextNumber > currentNumber) {
              setState(() {
                result = 'You lose';
                player = null;
                isClickable = false;
                livesNumber--;
              });
              if (livesNumber > 0) {
                setState(() {
                  currentNumber = Random().nextInt(13) + 1;
                  nextNumber = null;
                  isClickable = true;
                  player = 'Your';
                  result = 'You lose, Play Again ;)';
                  guesses = 10;
                });
              }
            } else {
              setState(() {
                player = 'Your';
                currentNumber = nextNumber;
              });
              if (guesses == 0) {
                player = null;
                result = 'You win!';
              }
            }
          }
        });
      }
    }
  }

  List<Icon> buildLives() {
    List<Icon> children = [];
    for (int i = livesNumber; i < 2; i++) {
      children.add(Icon(
        FontAwesomeIcons.heartBroken,
        color: Colors.red,
      ));
    }
    for (int i = 0; i < livesNumber; i++) {
      children.add(Icon(
        FontAwesomeIcons.solidHeart,
        color: Colors.red,
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            'Lives',
            style: TextStyle(
              color: Colors.teal.shade800,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildLives(),
          ),
          Text(
            'Current Number : $currentNumber',
            style: TextStyle(
              color: Colors.teal.shade800,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Guesses Left : $guesses',
            style: TextStyle(
              color: Colors.teal.shade800,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Higher(H) Or Lower(L)?',
                style: TextStyle(
                  color: Colors.teal.shade800,
                  fontSize: 18.0,
                ),
              ),
              MyDropDown<Guess>(
                value: initialValue,
                items: Guess.values,
                color: Colors.teal.shade800,
                onChanged: setDropDownValue,
              )
            ],
          ),
          MyRaisedButton(
            color: Colors.teal.shade800,
            text: 'Done',
            onPressed: isClickable ? generateNextNumber : null,
          ),
          Text(
            nextNumber != null ? 'Next Number $nextNumber' : '',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.orangeAccent,
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
