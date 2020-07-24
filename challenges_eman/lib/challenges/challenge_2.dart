import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge2 extends StatefulWidget {
  @override
  _Challenge2State createState() => _Challenge2State();
}

class _Challenge2State extends State<Challenge2> {
  String name = "";

  void onChange(text) {
    setState(() {
      name = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyTextField(
            myColor: Colors.purple.shade600,
            hint: 'What is your name?',
            label: 'Name',
            onChange: onChange,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Hello, $name',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple.shade600,
              fontSize: 20.0,
            ),
          ),
          Container(
            height: 0.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
