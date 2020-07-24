import 'package:flutter/material.dart';

class Challenge1 extends StatefulWidget {
  @override
  _Challenge1State createState() => _Challenge1State();
}

class _Challenge1State extends State<Challenge1> {
  String punchLine = "click anywhere to display a joke for you ;)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            punchLine =
                "Hear about the new restaurant called Karma? \n There\'s no menu: You get what you deserve.";
          });
        },
        child: Center(
          child: Text(
            punchLine,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple.shade500,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
