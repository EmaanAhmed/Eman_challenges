import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Challenge18 extends StatefulWidget {
  @override
  _Challenge18State createState() => _Challenge18State();
}

class _Challenge18State extends State<Challenge18> {
  String stars = '';
  int userInput;
  String errorMsg = '';
  void setUserInput(String newValue){
    setState(() {
      errorMsg = '';
    });
    try {
      bool isOdd = int.parse(newValue).remainder(2) == 1 ;
      if(isOdd) {
        userInput = int.parse(newValue);
      } else {
        setState(() {
          errorMsg = 'Please Enter odd Number';
        });
      }
    } on FormatException {
      setState(() {
        errorMsg = 'Please Enter Number';
      });
    }
  }

  void draw(){
    setState(() {
      this.stars = '';
    });
    stars += drawStars(2, 3) + '\n';
    stars += drawStars(2, 3) + '\n';
    stars += drawStars(3, 1) + '\n';
    stars += drawStars(2, 3) + '\n';
    stars += drawStars(0, 7) + '\n';
    stars += drawStars(3, 3) + '\n';
    stars += drawStars(3, 1) + drawStars(1, 1) + '\n';
    stars += drawStars(2, 2) + drawStars(1, 2) + '\n';
    setState(() {
      stars = stars;
    });
  }

  String drawStars(int spaces,int stars){

    String output = '';
    for(int i = 0; i<spaces ; i++){
      output += ' ';
    }
    for(int i =0 ; i<stars ; i++){
      output += '*';
    }
    return output;
  }

  void drawUserPyramid(){
    setState(() {
      stars = '';
    });
      int spaces = (userInput+1)~/2;
      for(int i= 1; i<=userInput ; i++){
        stars += drawStars(spaces, i) + '\n';
        spaces --;
        i++;
      }
      setState(() {
        stars = stars;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 18'),
      ),
      backgroundColor: Colors.blue.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Container(
            child: Text(stars,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue.shade700,
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200.0,
                child: MyTextField(
                  myColor: Colors.blue.shade700,
                  hint: 'Enter odd number',
                  label: 'base size',
                  onChange: setUserInput,
                ),
              ),
              MyRaisedButton(
                text: 'Draw',
                color: Colors.blue.shade700,
                onPressed: drawUserPyramid,
              )
            ],
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
            text: 'Draw Default Stars',
            color: Colors.blue.shade700,
            onPressed: draw,
          ),
        ],
      ),
    );
  }
}
