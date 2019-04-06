import 'package:flutter/material.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  elevation: 0.0,
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
                    "Monto cuenta",
                    //style: Theme.of(context).primaryTextTheme.title,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(17.0),
                  ),
                ),
                Text(
                  "0.00",
                  //"${formatter.format(billTotal)}",
                  //style: Theme.of(context).primaryTextTheme.headline,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  //"tip @ $tipPercent%",
                  "tip @ %",
                  //style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  //"${formatter.format(tip)}",
                  "tip",
                  //style: Theme.of(context).primaryTextTheme.headline,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total with tip",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  //"${formatter.format(totalWithTip)}",
                  "totalWithTip",
                  //style: Theme.of(context).primaryTextTheme.headline,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.all(15.0),
                height: 1.0,
                color: Theme.of(context).accentColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Split between",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  //"$tipSplit",
                  "tipSplit",
                  //style: Theme.of(context).primaryTextTheme.headline,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cost each",
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  //"${formatter.format(totalEach)}",
                  "total Each",
                  //style: Theme.of(context).primaryTextTheme.headline,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.all(15.0),
                height: 1.0,
                color: Theme.of(context).accentColor),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Tip Percentage",
                          //style: Theme.of(context).primaryTextTheme.title,
                          textAlign: TextAlign.right,
                        ),
                        IconButton(
                          iconSize: 50.0,
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
                        IconButton(
                          iconSize: 50.0,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Split between",
                          //style: Theme.of(context).primaryTextTheme.title,
                          textAlign: TextAlign.right,
                        ),
                        IconButton(
                          iconSize: 50.0,
                          onPressed: () {
                            // if (tipSplit > 1) {
                            //   tipSplit--;
                            //   calculateBill(null);
                            // }
                          },
                          icon: Icon(
                            Icons.remove_circle,
                          ),
                        ),
                        IconButton(
                          iconSize: 50.0,
                          onPressed: () {
                            // if (tipSplit < 50) {
                            //   tipSplit++;
                            //   calculateBill(null);
                            // }
                          },
                          icon: Icon(
                            Icons.add_circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 /// Simple calculation of bill amounts
  calculateBill(double total) {
    total = (total ?? billTotal);
    setState(() {
      billTotal = total;
      billTotalController.text = "${formatter.format(billTotal)}";
      tip = (total / 100) * tipPercent;
      totalWithTip = total + tip;
      totalEach = (totalWithTip / tipSplit);
    });
  }


