import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String output = '0';
  String result = '0';
  String operand = '0';
  double num1 = 0.0;
  double num2 = 0.0;

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      output = '0';
      result = '0';
      operand = '0';
      num1 = 0.0;
      num2 = 0.0;
    } else if (buttonText == '+' ||
        buttonText == 'X' ||
        buttonText == '/' ||
        buttonText == '-') {
      num1 = double.parse(output);
      operand = buttonText;
      result = '0';
    } else if (buttonText == '.') {
      if (result.contains('.')) {
        print('already contains a dot');
        return;
      } else {
        result = result + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
                  print(num1);
      if (operand == '+') {
        result = (num1 + num2).toString();

      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
      if (operand == 'X') {
        result = (num1 * num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      // result = '0';
      operand='';
    } else {
      result = result + buttonText;
    }

    setState(() {
      output = double.parse(result).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {buttonPressed(buttonText)},
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
                  padding: new EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: new Text(
                    output,
                    style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(
                child: Divider(),
              ),
              new Column(
                children: [
                  new Row(children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/')
                  ]),
                  new Row(children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X')
                  ]),
                  new Row(children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-')
                  ]),
                  new Row(children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+')
                  ]),
                  new Row(children: [
                    buildButton('CLEAR'),
                    buildButton('='),
                  ])
                ],
              )
            ],
          ),
        ));
  }
}
