import 'package:flutter/material.dart';
import 'package:tip_me/widgets/separador.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //NumberFormat formatter = NumberFormat("##0.00");
  TextEditingController billTotalController = TextEditingController();
  int tipPercent = 10, tipSplit = 1;
  double billTotal = 0.0;
  double tip = 0.0;
  double totalWithTip = 0.0;
  double totalEach = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Monto Cuenta
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  //elevation: 0.0,
                  onPressed: () async {
                    // var value = await Navigator.push(
                    //   context,
                    //   ScaleRoute(widget:  NumberPad(
                    //     billTotal,
                    //     normalStyle: Theme.of(context).textTheme.display2,
                    //     errorStyle: Theme.of(context).accentTextTheme.display2,
                    //   )),
                    // );
                    // if(value != null){
                    // //  calculateBill(value);
                    // }
                  },
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "MONTO CUENTA",
                    style: Theme.of(context).textTheme.button,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(17.0),
                  ),
                ),
                Text(
                  "0.00",
                  //"${formatter.format(billTotal)}",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Separador(),
            // PROPINA
            Row(
              children: <Widget>[
                Text(
                  //"tip @ $tipPercent%",
                  "% Propina",
                  style: Theme.of(context).textTheme.body1,
                ),
                Spacer(),
                IconButton(
                  iconSize: 37.0,
                  onPressed: () {
                    // if (tipPercent > 0) {
                    //   tipPercent--;
                    //   calculateBill(null);
                    // }
                  },
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                ),
                Text(
                  //"${formatter.format(tip)}",
                  "12.50%",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
                IconButton(
                  iconSize: 37.0,
                  onPressed: () {
                    // if (tipPercent < 100) {
                    //   tipPercent++;
                    //   calculateBill(null);
                    // }
                  },
                  icon: Icon(
                    Icons.add_circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  //"tip @ $tipPercent%",
                  "Monto Propina",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  //"${formatter.format(tip)}",
                  "0.00",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 17.0),
            // TOTAL
            Separador(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  //elevation: 0.0,
                  onPressed: () async {
                    // var value = await Navigator.push(
                    //   context,
                    //   ScaleRoute(widget:  NumberPad(
                    //     billTotal,
                    //     normalStyle: Theme.of(context).textTheme.display2,
                    //     errorStyle: Theme.of(context).accentTextTheme.display2,
                    //   )),
                    // );
                    // if(value != null){
                    // //  calculateBill(value);
                    // }
                  },
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "T O T A L",
                    style: Theme.of(context).textTheme.button,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(17.0),
                  ),
                ),
                Text(
                  //"${formatter.format(totalWithTip)}",
                  "0.00",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                //elevation: 0.0,
                onPressed: () async {
                  // var value = await Navigator.push(
                  //   context,
                  //   ScaleRoute(widget:  NumberPad(
                  //     billTotal,
                  //     normalStyle: Theme.of(context).textTheme.display2,
                  //     errorStyle: Theme.of(context).accentTextTheme.display2,
                  //   )),
                  // );
                  // if(value != null){
                  // //  calculateBill(value);
                  // }
                },
                color: Theme.of(context).accentColor,
                child: Text(
                  "REDONDEO",
                  style: Theme.of(context).textTheme.button,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(17.0),
                ),
              ),
            ),

            Separador(),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "# Personas",
                  style: Theme.of(context).textTheme.body1,
                ),
                Spacer(),
                IconButton(
                  iconSize: 37.0,
                  onPressed: () {
                    // if (tipPercent > 0) {
                    //   tipPercent--;
                    //   calculateBill(null);
                    // }
                  },
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                ),
                Text(
                  //"${formatter.format(tip)}",
                  "1",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
                IconButton(
                  iconSize: 37.0,
                  onPressed: () {
                    // if (tipPercent < 100) {
                    //   tipPercent++;
                    //   calculateBill(null);
                    // }
                  },
                  icon: Icon(
                    Icons.add_circle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Monto x Persona",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  //"${formatter.format(totalEach)}",
                  "0.00",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple calculation of bill amounts
calculateBill(double total) {
  // total = (total ?? billTotal);
  // setState(() {
  //   billTotal = total;
  //   billTotalController.text = "${formatter.format(billTotal)}";
  //   tip = (total / 100) * tipPercent;
  //   totalWithTip = total + tip;
  //   totalEach = (totalWithTip / tipSplit);
  // });
}
