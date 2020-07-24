import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Color myColor;
  final Function onChange;
  final String hint;
  final String label;
  final TextInputType type;

  const MyTextField(
      {this.myColor, this.onChange, this.hint, this.label, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: type == null ? TextInputType.text : type,
          maxLines: type == null ? 1 : 5,
          style: TextStyle(
            color: myColor,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: myColor,
              ),
            ),
            hintText: hint,
            labelText: label,
            labelStyle: TextStyle(
              color: myColor,
            ),
          ),
          onChanged: (text) {
            onChange(text);
          },
        ),
      ),
    );
  }
}
