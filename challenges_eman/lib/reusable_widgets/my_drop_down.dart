import 'package:flutter/material.dart';

class MyDropDown<T> extends StatelessWidget {
  final T value;
  final Function onChanged;
  final List<T> items;
  final Color color;

  const MyDropDown({this.value, this.onChanged, this.items, this.color});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: color,
      ),
      underline: Container(
        height: 2,
        color: color,
      ),
      onChanged: (T newValue) {
        onChanged(newValue);
      },
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}
