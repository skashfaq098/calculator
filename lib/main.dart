import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var output = "";
  var result = "";
  var num1 = "";
  var num2 = "";
  var operand = "";

  buttonPressed(String buttonText) {
    if ((buttonText == "0" ||
            buttonText == "1" ||
            buttonText == "2" ||
            buttonText == "3" ||
            buttonText == "4" ||
            buttonText == "5" ||
            buttonText == "6" ||
            buttonText == "7" ||
            buttonText == "8" ||
            buttonText == "9" ||
            buttonText == "." ||
            buttonText == "00") &&
        operand == "") {
      //save to num1
      num1 += buttonText;
      setState(() {
        output = num1;
      });
      print("Num1: " + num1);
    } else if ((buttonText == "0" ||
            buttonText == "1" ||
            buttonText == "2" ||
            buttonText == "3" ||
            buttonText == "4" ||
            buttonText == "5" ||
            buttonText == "6" ||
            buttonText == "7" ||
            buttonText == "8" ||
            buttonText == "9" ||
            buttonText == "." ||
            buttonText == "00") &&
        operand != "") {
      //save to num2
      num2 += buttonText;
      setState(() {
        output = num2;
      });

      print("Num2: " + num2);
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      // save operand
      print("Got operand: " + buttonText); //to remove
      operand = buttonText;
      setState(() {
        output = operand;
      });
    } else if (buttonText == "CLEAR") {
      //reset all values
      print("Clear: " + buttonText); // to remove
      result = "";
      num1 = "";
      num2 = "";
      operand = "";
      setState(() {
        output = "";
      });
    } else if (buttonText == "=") {
      //calculate result
      if (operand == "+") {
        result = (double.parse(num1) + double.parse(num2)).toString();
      } else if (operand == "-") {
        result = (double.parse(num1) - double.parse(num2)).toString();
      } else if (operand == "/") {
        result = (double.parse(num1) / double.parse(num2)).toString();
      } else if (operand == "X") {
        result = (double.parse(num1) * double.parse(num2)).toString();
      } else {
        print('Error calculating result');
      }
      setState(() {
        output = result;
      });
      num1 = "";
      num2 = "";
      operand = "";
      result = "";
    }
  }

  Widget buildbutton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(25.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: new Text(
                  output,
                  style: new TextStyle(
                      fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Expanded(
                child: Divider(),
              ),
              new Column(children: [
                new Row(children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("/")
                ]),
                new Row(children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                  buildbutton("X")
                ]),
                new Row(children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                  buildbutton("-")
                ]),
                new Row(children: [
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("00"),
                  buildbutton("+")
                ]),
                new Row(children: [
                  buildbutton("CLEAR"),
                  buildbutton("="),
                ]),
              ])
            ],
          ),
        ));
  }
}
