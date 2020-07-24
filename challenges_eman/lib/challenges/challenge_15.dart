import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge15 extends StatefulWidget {
  @override
  _Challenge15State createState() => _Challenge15State();
}

class _Challenge15State extends State<Challenge15> {
  String sentence = '';

  void setSentence(String input) {
    sentence = input;
  }

  void countWords() {
    sentence.split(RegExp(' |.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          MyTextField(
            hint: 'Enter your Sentence of maximum 5 lines',
            label: 'Sentence',
            myColor: Colors.teal.shade900,
            type: TextInputType.multiline,
            onChange: setSentence,
          ),
          MyRaisedButton(
            text: 'Done',
            color: Colors.teal.shade900,
            onPressed: countWords,
          ),
        ],
      ),
    );
  }
}
