import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge15 extends StatefulWidget {
  @override
  _Challenge15State createState() => _Challenge15State();
}

class _Challenge15State extends State<Challenge15> {
  String sentence = '';
  String result;
  String reversedSentence = '';

  void setSentence(String input) {
    sentence = input;
  }

  void countWords() {
//    sentence.split(RegExp(r"(\w+)[\s-\.]"));
  setState(() {
    reversedSentence = '';
  });
    List<String> words = sentence.split(RegExp(r"[\s-\.]"));
    setState(() {
      result = (words.length -1).toString();
    });
    for(int i = words.length -1; i> 0; i--){
      reversedSentence += words[i-1] + ' ';
    }
    setState(() {
      reversedSentence = reversedSentence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 15'),
      ),
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
            hint: 'EnterSentence finished with dot "." ',
            label: 'Sentence',
            myColor: Colors.teal.shade900,
            onChange: setSentence,
          ),
          MyRaisedButton(
            text: 'Done',
            color: Colors.teal.shade900,
            onPressed: countWords,
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
          Text(
            reversedSentence.isNotEmpty ?  'Reversed Sentence:\n$reversedSentence' : '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
