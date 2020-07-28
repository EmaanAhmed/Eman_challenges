import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge4 extends StatefulWidget {
  @override
  _Challenge4State createState() => _Challenge4State();
}

class _Challenge4State extends State<Challenge4> {
  int speed;
  int time;

  int distance;
  String errorMsg = '';

  void clearErrorMsg() {
    setState(() {
      errorMsg = '';
    });
  }

  void setSpeed(String input) {
    clearErrorMsg();
    try {
      speed = int.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter integers';
      });
    }
  }

  void setTime(String input) {
    clearErrorMsg();
    try {
      time = int.parse(input);
      if (time == 0) {
        setState(() {
          errorMsg = 'Time should\'nt be Zero';
        });
      }
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter integers';
      });
    }
  }

  void setDistance(String input) {
    clearErrorMsg();
    try {
      distance = int.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter integers';
      });
    }
  }

  void calculateDistanceTravelled() {
    if (speed == null || time == null) {
      setState(() {
        errorMsg = 'Please fill speed & time';
      });
    } else {
      if (errorMsg.isEmpty) {
        setState(() {
          distance = speed * time;
        });
      }
    }
  }

  void calculateSpeedNeeded() {
    if (distance == null || time == null) {
      setState(() {
        errorMsg = 'Please fill distance & time';
      });
    } else {
      if (errorMsg.isEmpty) {
        setState(() {
          speed = distance ~/ time;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 4'),
      ),
      backgroundColor: Colors.purple.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 0.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: MyTextField(
                  hint: 'Enter Speed',
                  label: 'Speed',
                  myColor: Colors.purple.shade800,
                  onChange: setSpeed,
                ),
              ),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.purple.shade800,
                ),
              ),
              Expanded(
                child: MyTextField(
                  hint: 'Enter Distance',
                  label: 'Distance',
                  myColor: Colors.purple.shade800,
                  onChange: setDistance,
                ),
              ),
            ],
          ),
          MyTextField(
            hint: 'Enter Time',
            label: 'Time',
            myColor: Colors.purple.shade800,
            onChange: setTime,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: MyRaisedButton(
                  text: 'Calculate Distance Travelled',
                  color: Colors.purple.shade800,
                  onPressed: calculateDistanceTravelled,
                ),
              ),
              Expanded(
                child: MyRaisedButton(
                  text: 'Calculate Speed Needed',
                  color: Colors.purple.shade800,
                  onPressed: calculateSpeedNeeded,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  distance != null ? 'Distance Traveled = $distance' : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  speed != null ? 'Speed Needed = $speed' : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
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
        ],
      ),
    );
  }
}
