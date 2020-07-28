import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Challenge8 extends StatefulWidget {
  @override
  _Challenge8State createState() => _Challenge8State();
}

class _Challenge8State extends State<Challenge8> {
  DateTime birthDay;
  DateTime today = DateTime.now();
  bool isLegal;
  setBirthDay(DateTime date) {
    birthDay = date;
    int diff = today.year - birthDay.year;
    if (diff >= 18) {
      setState(() {
        isLegal = true;
      });
    } else {
      setState(() {
        isLegal = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 8'),
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                onConfirm: (date) {
                  setBirthDay(date);
                },
                currentTime: DateTime.now(),
                maxTime: DateTime.now(),
              );
            },
            child: Text(
              'Click to Choose your birthday ^_^',
              style: TextStyle(color: Colors.purple.shade700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isLegal != null
                  ? isLegal
                      ? 'You are Allowed to Vote'
                      : 'You\'re not Allowed to Vote'
                  : '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
