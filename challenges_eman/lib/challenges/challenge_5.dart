import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'challenge_7.dart';

class Challenge5 extends StatefulWidget {
  @override
  _Challenge5State createState() => _Challenge5State();
}

class _Challenge5State extends State<Challenge5> {
  DateTime birthDay;
  DateTime today = DateTime.now();
  int daysLived;
  bool isVisible = false;

  void setBirthDay(DateTime date) {
    birthDay = date;
    setState(() {
      daysLived = today.difference(birthDay).inDays;
      isVisible = true;
    });
  }

  void headToChallenge7() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Challenge7()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 5'),
      ),
      backgroundColor: Colors.purple.shade100,
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
              style: TextStyle(color: Colors.purple.shade900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              daysLived != null
                  ? 'You Lived for $daysLived Days!\nKeep Growing ;)'
                  : '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            child: Column(
              children: <Widget>[
                Divider(),
                Text(
                  'Wanna Know how quick you are at typing the alphabet? Hit the button below ;)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18.0,
                  ),
                ),
                MyRaisedButton(
                  color: Colors.purple.shade900,
                  text: 'Go!',
                  onPressed: headToChallenge7,
                )
              ],
            ),
            visible: isVisible,
          ),
        ],
      ),
    );
  }
}
