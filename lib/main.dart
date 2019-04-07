import 'package:flutter/material.dart';
import 'package:tip_me/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Me',
      theme: myTheme(),
      home: MyHomePage(title: 'Tip Me'),
    );
  }
}

ThemeData myTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    //Texans
    primaryColor: Color(0xFF001331),
    accentColor: Color(0xFFB82633),
    //fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 27.0, fontStyle: FontStyle.italic, color: Colors.green),
      body1: TextStyle(fontSize: 17.0,),
      body2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      button: TextStyle(fontSize: 17.0,),
    ),
  );
}
