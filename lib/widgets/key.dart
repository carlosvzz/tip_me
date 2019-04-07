import 'package:flutter/material.dart';

class RoundKey extends StatelessWidget {
  final String value;
  final Color color;
  final Function onPressed;

  RoundKey(this.value, {@required this.onPressed, this.color: Colors.grey});

  Widget _childDisplay(BuildContext context) {
    if (value == '<') {
      return Icon(Icons.backspace, color: Theme.of(context).accentColor,);
    }
     else {
      return Text(value, style: Theme.of(context).accentTextTheme.button);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
          ),
          onPressed: () {
            onPressed(value);
          },
          child: _childDisplay(context),
        ));
  }
}
