import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Challenge3 extends StatefulWidget {
  @override
  _Challenge3State createState() => _Challenge3State();
}

class _Challenge3State extends State<Challenge3> {
  double width;
  double height;
  double breadth;
  double area = 0.0;
  double volume = 0.0;
  String errorMsg = "";

  void setWidth(String input) {
    setState(() {
      errorMsg = "";
    });
    try {
      width = double.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter Numbers';
      });
    }
  }

  void setHeight(String input) {
    setState(() {
      errorMsg = "";
    });
    try {
      height = double.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter Numbers';
      });
    }
  }

  void setBreadth(String input) {
    setState(() {
      errorMsg = "";
    });
    try {
      breadth = double.parse(input);
    } on FormatException {
      setState(() {
        errorMsg = 'Please enter Numbers';
      });
    }
  }

  void calculateArea() {
    if (width == null || height == null) {
      setState(() {
        errorMsg = 'Please fill width & height';
      });
    } else {
      if (errorMsg.isEmpty) {
        setState(() {
          area = width * height;
        });
      }
    }
  }

  void calculateVolume() {
    if (width == null || height == null || breadth == null) {
      setState(() {
        errorMsg = 'Please fill width & height & breadth';
      });
    } else {
      if (errorMsg.isEmpty) {
        setState(() {
          volume = width * height * breadth;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 3'),
      ),
      backgroundColor: Colors.purple.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          MyTextField(
            myColor: Colors.purple.shade700,
            label: 'Width',
            hint: 'Enter Rectangle/Cuboid Width',
            onChange: setWidth,
          ),
          MyTextField(
            myColor: Colors.purple.shade700,
            label: 'Height',
            hint: 'Enter Rectangle/Cuboid Height',
            onChange: setHeight,
          ),
          MyTextField(
            myColor: Colors.purple.shade700,
            label: 'Breadth',
            hint: 'Enter Cuboid Breadth',
            onChange: setBreadth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: MyRaisedButton(
                  text: 'Calculate Rectangle Area',
                  color: Colors.purple.shade700,
                  onPressed: calculateArea,
                ),
              ),
              Expanded(
                child: MyRaisedButton(
                  text: 'Calculate Cuboid Volume',
                  color: Colors.purple.shade700,
                  onPressed: calculateVolume,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Area = $area',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Volume = $volume',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
