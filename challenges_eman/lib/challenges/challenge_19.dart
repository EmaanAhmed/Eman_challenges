import 'package:challenges_eman/reusable_widgets/my_raised_button.dart';
import 'package:challenges_eman/reusable_widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Challenge19 extends StatefulWidget {
  @override
  _Challenge19State createState() => _Challenge19State();
}

class _Challenge19State extends State<Challenge19> {

  String statement;
  int key;
  String result;
  String errorMsg = '';

  void setStatement(String val){
    statement = val;
  }
  void setKey(String val){
    setState(() {
      errorMsg = '';
    });
    try {
        key = int.parse(val);
    } on FormatException {
      setState(() {
        errorMsg = 'Please Enter Number';
      });
    }
  }

  void getResult(){
    setState(() {
      errorMsg = '';
      result = '';
    });
    if(statement == null || key == null){
      setState(() {
        errorMsg = 'Please Fill data first';
      });
    } else {
      setState(() {
        result += 'Encrypted : ${encrypt()}\nDecrypted: ${decrypt()}';
      });
    }
  }

  String encrypt(){
    statement = statement.toLowerCase();
    String cipherText = '';
    for(int i =0; i< statement.length ; i++){
      int charAscii = statement.codeUnitAt(i);
      int keyVal = (key + charAscii).remainder(128);
      String replaceVal = String.fromCharCode(keyVal);
      cipherText += replaceVal;
    }
    return cipherText;
  }

  String decrypt(){
    statement = statement.toLowerCase();
    String plainText = '';
    for(int i =0; i< statement.length ; i++){
      int charAscii = statement.codeUnitAt(i);
      int keyVal = (charAscii - key).remainder(128);
      if( keyVal < 0){
        keyVal = 128 + keyVal;
      }
      String replaceVal = String.fromCharCode(keyVal);
      plainText += replaceVal;
    }
    return plainText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge 19'),
      ),
      backgroundColor: Colors.blue.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          MyTextField(
            myColor: Colors.blue.shade800,
            hint: 'Enter Statement',
            label: 'Statement',
            onChange: setStatement,
          ),
          MyTextField(
            myColor: Colors.blue.shade800,
            hint: 'Enter Key',
            label: 'Key',
            onChange: setKey,
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
            color: Colors.blue.shade800,
            text: 'Show Results',
            onPressed: getResult,
          ),
          Text(
            result != null ? result : '',
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
