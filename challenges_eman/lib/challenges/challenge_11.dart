import 'package:challenges_eman/reusable_widgets/my_drop_down.dart';
import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:flutter/material.dart';

enum Gate {
  OR,
  AND,
  XOR,
  NAND,
  NOR,
}

class Challenge11 extends StatefulWidget {
  @override
  _Challenge11State createState() => _Challenge11State();
}

class _Challenge11State extends State<Challenge11> {
  Gate dropDownValue = Gate.OR;
  int firstInput = 0;
  int secondInput = 0;

  int result;

  void setGateChosen(Gate newValue) {
    setState(() {
      dropDownValue = newValue;
    });
  }

  void setFirstInput(int newValue) {
    setState(() {
      firstInput = newValue;
    });
  }

  void setSecondInput(int newValue) {
    setState(() {
      secondInput = newValue;
    });
  }

  void setResult(int value) {
    setState(() {
      result = value;
    });
  }

  void getAnswer() {
    if (dropDownValue == Gate.AND) {
      if (firstInput == 1 && secondInput == 1) {
        setResult(1);
      } else {
        setResult(0);
      }
    } else if (dropDownValue == Gate.OR) {
      if (firstInput == 1 || secondInput == 1) {
        setResult(1);
      } else {
        setResult(0);
      }
    } else if (dropDownValue == Gate.XOR) {
      if (firstInput != secondInput) {
        setResult(1);
      } else {
        setResult(0);
      }
    } else if (dropDownValue == Gate.NAND) {
      if (firstInput == 1 && secondInput == 1) {
        setResult(0);
      } else {
        setResult(1);
      }
    } else if (dropDownValue == Gate.NOR) {
      if (firstInput == 0 && secondInput == 0) {
        setResult(1);
      } else {
        setResult(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Text(
            'Choose Gate',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.teal.shade500,
            ),
          ),
          MyDropDown<Gate>(
            value: dropDownValue,
            color: Colors.teal.shade500,
            onChanged: setGateChosen,
            items: Gate.values,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'First Input',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal.shade500,
                ),
              ),
              MyDropDown<int>(
                value: firstInput,
                color: Colors.teal.shade500,
                items: [0, 1],
                onChanged: setFirstInput,
              ),
              Text(
                'Second Input',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal.shade500,
                ),
              ),
              MyDropDown<int>(
                value: secondInput,
                color: Colors.teal.shade500,
                items: [0, 1],
                onChanged: setSecondInput,
              ),
            ],
          ),
          MyRaisedButton(
            text: 'Show Result',
            color: Colors.teal.shade500,
            onPressed: getAnswer,
          ),
          Text(
            result != null ? 'Result = $result' : '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
