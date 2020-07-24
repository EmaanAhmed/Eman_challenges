import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const MyRaisedButton({this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 20.0,
            ),
          ),
        ),
        onPressed: onPressed == null
            ? null
            : () {
                onPressed();
              },
      ),
    );
  }
}
