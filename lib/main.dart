import 'package:flutter/material.dart';
import 'package:tip_me/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Me',
      theme: _myTheme(),
      home: MyHomePage(title: 'Tip Me'),
    );
  }
}

ThemeData _myTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    //Texans
    primaryColor: Color(0xFF001331),
    accentColor: Color(0xFFB82633),
    //fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
      title: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, color: Colors.green),
      body1: TextStyle(fontSize: 20.0,),
      body2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      button: TextStyle(fontSize: 20.0,),
    ),
    accentTextTheme: TextTheme(
      headline: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
      body2: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.red),
      button: TextStyle(fontSize: 27.0,fontWeight: FontWeight.bold),
    ),
  );
}
