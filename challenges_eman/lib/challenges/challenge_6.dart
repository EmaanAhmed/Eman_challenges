import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';

class Challenge6 extends StatefulWidget {
  @override
  _Challenge6State createState() => _Challenge6State();
}

class _Challenge6State extends State<Challenge6> {
  int firstTime;
  int secondTime;
  bool isVisible = false;
  int difference;
  String result = '';

  void setFirstTime() {
    firstTime = DateTime.now().second;
    setState(() {
      isVisible = true;
    });
  }

  void setSecondTime() {
    secondTime = DateTime.now().second;
    difference = secondTime - firstTime;
    if (difference == 0) {
      setState(() {
        result = 'You got this Right !! ;)\nYou\'re Awesome :*';
      });
    } else if (difference >= 10) {
      setState(() {
        result = 'You went far, $difference seconds elapsed :(';
      });
    } else {
      setState(() {
        result = 'Mmmmm you needed to wait for ${10 - difference} seconds :(';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 6'),
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
            'Wanna see how good are you at guessing when 10 seconds have elapsed?\nClick ready button when you\'re ready ;)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple.shade500,
              fontSize: 18.0,
            ),
          ),
          MyRaisedButton(
            color: Colors.deepPurple.shade500,
            text: 'I\'am Ready!',
            onPressed: setFirstTime,
          ),
          Visibility(
            child: Container(
              width: 250.0,
              child: MyRaisedButton(
                color: Colors.deepPurple.shade500,
                text: 'Hit here when you think time has elapsed ;)',
                onPressed: setSecondTime,
              ),
            ),
            visible: isVisible,
          ),
          Text(
            result,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
