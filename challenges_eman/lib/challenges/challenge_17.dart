import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';

class Challenge17 extends StatefulWidget {
  @override
  _Challenge17State createState() => _Challenge17State();
}

class _Challenge17State extends State<Challenge17> {

  int ratingOne = 50;
  int ratingTwo = 50;
  String result;

  //TODO: think of the challenge Extension


  void getResult(){
    String moduleOne = getGrade(ratingOne);
    String moduleTwo = getGrade(ratingTwo);
    print((ratingOne + ratingTwo)~/2);
    String asLevel = getGrade((ratingOne + ratingTwo)~/2);

    setState(() {
      result = 'Module 1: $moduleOne\nModule 2: $moduleTwo\nAS Level: $asLevel';
    });
  }

  String getGrade(int val){
    if(val >= 80){
      return 'A';
    } else if(val >= 70){
      return 'B';
    } else if(val >=60) {
      return 'C';
    } else if(val >= 50){
      return 'D';
    } else if(val >= 40){
      return 'E';
    } else if(val < 40) {
      return 'U';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 17'),
      ),
      backgroundColor: Colors.blue.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Module 1 Result: ${ratingOne.toInt()}',
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18.0,
                ),
              ),
              Slider(
                value: ratingOne.toDouble(),
                onChanged: (newRating){
                  setState(() {
                    ratingOne = newRating.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Module 2 Result: ${ratingTwo.toInt()}',
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18.0,
                ),
              ),
              Slider(
                value: ratingTwo.toDouble(),
                onChanged: (newRating){
                  setState(() {
                    ratingTwo = newRating.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
            ],
          ),
          MyRaisedButton(
            text: 'Get Result',
            color: Colors.blue.shade600,
            onPressed: getResult,
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
