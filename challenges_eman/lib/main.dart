import 'package:challenges_eman/challenges/challenge_1.dart';
import 'package:challenges_eman/challenges/challenge_10.dart';
import 'package:challenges_eman/challenges/challenge_11.dart';
import 'package:challenges_eman/challenges/challenge_12.dart';
import 'package:challenges_eman/challenges/challenge_13.dart';
import 'package:challenges_eman/challenges/challenge_14.dart';
import 'package:challenges_eman/challenges/challenge_15.dart';
import 'package:challenges_eman/challenges/challenge_17.dart';
import 'package:challenges_eman/challenges/challenge_18.dart';
import 'package:challenges_eman/challenges/challenge_2.dart';
import 'package:challenges_eman/challenges/challenge_3.dart';
import 'package:challenges_eman/challenges/challenge_5.dart';
import 'package:challenges_eman/challenges/challenge_6.dart';
import 'package:challenges_eman/challenges/challenge_7.dart';
import 'package:challenges_eman/challenges/challenge_8.dart';
import 'package:challenges_eman/challenges/challenge_9.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'challenge_list.dart';
import 'challenges/challenge_16.dart';
import 'challenges/challenge_19.dart';
import 'challenges/challenge_4.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'Challenge1': (context) => Challenge1(),
        'Challenge2': (context) => Challenge2(),
        'Challenge3': (context) => Challenge3(),
        'Challenge4': (context) => Challenge4(),
        'Challenge5': (context) => Challenge5(),
        'Challenge6': (context) => Challenge6(),
        'Challenge7': (context) => Challenge7(),
        'Challenge8': (context) => Challenge8(),
        'Challenge9': (context) => Challenge9(),
        'Challenge10': (context) => Challenge10(),
        'Challenge11': (context) => Challenge11(),
        'Challenge12': (context) => Challenge12(),
        'Challenge13': (context) => Challenge13(),
        'Challenge14': (context) => Challenge14(),
        'Challenge15': (context) => Challenge15(),
        'Challenge16': (context) => Challenge16(),
        'Challenge17': (context) => Challenge17(),
        'Challenge18': (context) => Challenge18(),
        'Challenge19': (context) => Challenge19(),

      },
      home: ChallengeList(),
    );
  }
}





