import 'dart:async';

import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Challenge9 extends StatefulWidget {
  @override
  _Challenge9State createState() => _Challenge9State();
}

class _Challenge9State extends State<Challenge9> {
  List<String> suits = ['Spades ♠', 'Hearts ♥', 'Diams ♦', 'Clubs ♣'];
  List<String> cards = [
    'Ace',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'Jack',
    'Queen',
    'King'
  ];
  String suit = '';
  String card = '';
  bool isButtonDisabled = false;

  void generateRandomCard() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          suit = suits[Random().nextInt(4)];
          card = cards[Random().nextInt(13)];
        });
      }
    });
    setState(() {
      isButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 9'),
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            '$card $suit',
            style: TextStyle(
              color: Colors.deepPurple.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 250.0,
            child: MyRaisedButton(
              text: 'Generate Cards every 3 Seconds',
              color: Colors.deepPurple.shade800,
              onPressed: isButtonDisabled ? null : generateRandomCard,
            ),
          ),
        ],
      ),
    );
  }
}
