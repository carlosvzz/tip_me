import 'package:flutter/material.dart';

class Separador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 1.0,
        color: Theme.of(context).accentColor);
  }
}
