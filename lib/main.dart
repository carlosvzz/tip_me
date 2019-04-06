import 'package:flutter/material.dart';
import 'package:tip_me/homepage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Me',
      theme: ThemeData(
        primaryColor: Color(0xFF001331),        
        accentColor: Color(0xFFB82633)
      ),
      home: MyHomePage(title: 'Tip Me'),
    );
  }
}


