import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/key.dart';

class NumberPad extends StatefulWidget {
  final String titulo;
  final double valorActual;
  final int digitLimit = 8;
 
  NumberPad(this.titulo, this.valorActual);

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  String displayedValue = "";
  double billValue = 0.0;
  TextStyle displayStyle;
  NumberFormat formatter = NumberFormat("##0.00");


  @override
  void initState() {
    super.initState();

    //billValue = widget.valorActual;
    billValue = 0.0;
    if (billValue > 0.0) {
      displayedValue = formatter.format(billValue);
    }
    displayStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
            width: 320.0,
            height: 600.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      widget.titulo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Card(
                          margin: EdgeInsets.all(5.0),
                          color: Colors.white,
                          child: Text(
                            displayedValue,
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: displayStyle,
                          ),
                        ), ),
                      SizedBox(width: 8.0,),
                      FlatButton(                        
                        color: Theme.of(context).accentColor,
                        child: Icon(Icons.clear),
                        onPressed: () => keyEntry('X'),
                      ),
                    ],
                  ),
                  
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10.0),
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 3,
                      children: <Widget>[
                        RoundKey(
                          "7",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "8",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "9",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "4",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "5",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "6",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "1",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "2",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "3",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "<",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          "0",
                          onPressed: keyEntry,
                        ),
                        RoundKey(
                          ".",
                          onPressed: keyEntry,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        try {
                          Navigator.pop(context, (billValue > 0.0) ? billValue : null);
                        } catch (e) {}
                      },
                      child: Text(
                        "ACEPTAR",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

 

  /// Method used to track, check and update the displayed bill total
  /// we have a display length limit imposed so we do not overflow the main dsplay
  keyEntry( value) {
    String display = displayedValue;
    TextStyle normalStyle =TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle errorStyle =TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.red);

    
    if (value == "<") {
      display =(display.length > 0) ? display.substring(0, display.length - 1) : "";
    } else if (value == 'X') {
      display = '';
    } 
    else {
      if (display.length < widget.digitLimit) {
        display += value;
      }
    }

    double billTotal = 0.0;
    if (display.length > 0) {
      try {
        billTotal = double.parse(display);
        displayStyle = normalStyle;
      } catch (e) {
        displayStyle = errorStyle;
      }
    }
    setState(() {
      displayedValue = display;
      billValue = billTotal;
    });
  }
}
