import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/separador.dart';
import 'number_pad.dart';
import 'widgets/router.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumberFormat formatter = NumberFormat("##0.00");

  double montoCuenta = 0.0;
  double montoPropina = 0.0;
  double montoTotal = 0.0;
  double montoPersona = 0.0;

  double propinaPorc = 12.5;
  int numPersonas = 1;

  /// Calculo General de montos
  calcularBaseCuenta(double total) {
    total = (total ?? montoCuenta);
    setState(() {
      montoCuenta = total;
      //montoCuentaController.text = "${formatter.format(montoCuenta)}";

      montoPropina = total * (propinaPorc / 100);
      montoTotal = total + montoPropina;
      montoPersona = (montoTotal / numPersonas);
    });
  }

  // Aumenta / Disminuye % propina en un bloques de 0.5 
  double actualizarPropinaPorc(String id) {
    int valorBase = propinaPorc.toInt();
    double valorDecimal = propinaPorc - valorBase; 
    double valorRetorno;


    debugPrint(valorBase.toString());
    debugPrint(valorDecimal.toString());

    if (id == "+") {
      if (valorDecimal < 0.5) {
        valorRetorno =  valorBase.toDouble() + 0.5;
      } else {
        valorRetorno = valorBase.toDouble() + 1.0;
      }

    } else { // Restar
      if (valorDecimal == 0.0) {
        valorRetorno =  valorBase.toDouble() - 0.5;
      } else if (valorDecimal <= 0.5) {
        valorRetorno = valorBase.toDouble();
      } else {
        valorRetorno = valorBase.toDouble() + 0.5;
      }

    }
    debugPrint(valorRetorno.toString());
    return valorRetorno;
  }

  /// Calculo de monto de personas
  calcularMontoPersona() {
    setState(() {
      montoPersona = (montoTotal / numPersonas);
    });
  }

  /// Calcular Redondeo del total
  calcularBaseTotal(double total) {
    total = (total ?? montoTotal);
    setState(() {
      montoPropina = total - montoCuenta;
      propinaPorc = (montoPropina / montoCuenta) * 100;

      montoTotal = total.toDouble();
      montoPersona = (montoTotal / numPersonas);
    });
  }

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
                    var value = await Navigator.push(
                      context,
                      ScaleRoute(widget: NumberPad('MONTO CUENTA', montoCuenta)),
                    );
                    if (value != null) {
                      calcularBaseCuenta(value);
                    }
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
                  "${formatter.format(montoCuenta)}",
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
                  "% Propina",
                  style: Theme.of(context).textTheme.body1,
                ),
                Spacer(),
                IconButton(
                  iconSize: 40.0,
                  onPressed: () {
                    if (propinaPorc > 0) {
                      propinaPorc = actualizarPropinaPorc('-');
                      calcularBaseCuenta(null);
                    }
                  },
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                ),
                Text(
                  "${formatter.format(propinaPorc)}",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
                IconButton(
                  iconSize: 40.0,
                  onPressed: () {
                    if (propinaPorc < 100) {
                     propinaPorc = actualizarPropinaPorc('+');
                      calcularBaseCuenta(null);
                    }
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
                  "${formatter.format(montoPropina)}",
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
                    var value = await Navigator.push(
                      context,
                      ScaleRoute(
                          widget: NumberPad(
                        'T O T A L',montoTotal
                      )),
                    );
                    if (value != null) {
                      calcularBaseTotal(value);
                    }
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
                  "${formatter.format(montoTotal)}",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            // Redondeo
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: () => calcularBaseTotal(montoTotal.ceilToDouble()),
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
                  iconSize: 40.0,
                  onPressed: () {
                    if (numPersonas > 1) {
                      numPersonas--;
                      calcularMontoPersona();
                    }
                  },
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                ),
                Text(
                  numPersonas.toString(),
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.right,
                ),
                IconButton(
                  iconSize: 40.0,
                  onPressed: () {
                    if (numPersonas < 20) {
                      numPersonas++;
                      calcularMontoPersona();
                    }
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
                  "${formatter.format(montoPersona)}",
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
