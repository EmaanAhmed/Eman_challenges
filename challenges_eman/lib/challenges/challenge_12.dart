import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Challenge12 extends StatefulWidget {
  @override
  _Challenge12State createState() => _Challenge12State();
}

class _Challenge12State extends State<Challenge12> {
  int number = 0;
  String errorMsg = '';
  List<int> factors = [];
  void setNumber(String input) {
    setState(() {
      errorMsg = '';
    });
    try {
      number = int.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please Enter Number';
      });
    }
  }

  void calculateFactors() {
    setState(() {
      factors.clear();
    });
    if (errorMsg.isEmpty) {
      for (int i = 1; i <= sqrt(number); i++) {
        if (number.remainder(i) == 0) {
          if (number / i == i) {
            setState(() {
              factors.add(i);
              print(factors);
            });
          } else {
            setState(() {
              factors.add(i);
              factors.add(number ~/ i);
            });
          }
        }
      }
      factors.sort();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 12'),
      ),
      backgroundColor: Colors.teal.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          MyTextField(
            label: 'Number',
            hint: 'Enter Integer Number',
            myColor: Colors.teal.shade600,
            onChange: setNumber,
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
            text: 'Display Factors',
            color: Colors.teal.shade600,
            onPressed: calculateFactors,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              factors.isNotEmpty && factors.length > 2
                  ? 'Result = ${factors.join(' ')}'
                  : 'This is a Prime number, doesn\'t have factors ;)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
