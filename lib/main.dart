import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String operand = "";
  String _history = '';
  String _expression = '';

  buttonPressed(String btnVal) {
    print(btnVal);
    if (btnVal == "AC") {
      setState(() {
        _history = '';
        _expression = '';
      });
    } else if (btnVal == "⌫") {
      setState(() {
        //_expression = '';
        _expression = _expression.substring(0, _expression.length - 1);
        print(_expression.length);
      });
    } else if (btnVal == "=") {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setState(() {
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();

        print(_expression.length);
      });
    } else if (btnVal == "±") {
      int a = -1;
      int res = a * int.parse(_expression);
      _expression = res.toString();
      setState(() => _expression);
    } else if (btnVal == "√x") {
      Power xSquare = Power(_expression, 0.5);
      setState(() {
        _expression = xSquare.toString();
      });
    } else if (btnVal == "%") {
      print(_expression[0]);
      double result = double.parse(_expression) * 0.01;
      setState(() {
        _expression = result.toString();
      });
    } else {
      if (btnVal == "x") {
        btnVal = "*";
      } else if (btnVal == "÷") {
        btnVal = "/";
      }
      setState(() => _expression += btnVal);

      print(_expression.length);
    }
  }

  Widget buildButton(String buttonVal,
      [Color buttoncolor = const Color(0xFFE0E0E0),
      Color textcolor = const Color(0xFF7F7FA5)]) {
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        color: buttoncolor != null ? buttoncolor : Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade200,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0)
        ],
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonVal,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: textcolor != null ? textcolor : Color(0xFF7F7FA5),
          ),
        ),
        onPressed: () => buttonPressed(buttonVal),
      ),
    ));
  }

  Widget buildButtonoval(String buttonVal,
      [Color buttoncolor = const Color(0xFFDBDBF9),
      Color textcolor = const Color(0xFF7F7FA5)]) {
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        color: buttoncolor != null ? buttoncolor : Color(0xFFDBDBF9),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade200,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0)
        ],
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        child: Text(
          buttonVal,
          style: TextStyle(
              color: textcolor != null ? textcolor : Color(0xFF7F7FA5),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonVal),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _expression,
                      style: TextStyle(
                          fontSize: _expression.length <= 11 ? 55 : 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF41416E)),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '=',
                      style: TextStyle(fontSize: 35, color: Color(0xFF7F7FA5)),
                    ),
                    Text(
                      _history,
                      style: TextStyle(fontSize: 20, color: Color(0xFF7F7FA5)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButtonoval("√x"),
                        buildButtonoval("^"),
                        buildButtonoval("e"),
                        buildButtonoval("%"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("AC", Color(0xFFDBDBF9)),
                        buildButton("±", Color(0xFFDBDBF9)),
                        buildButton("÷", Color(0xFFDBDBF9)),
                        buildButton("⌫", Color(0xFFF8C6C6), Color(0xFFFF7B7B)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("x", Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("-", Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("+", Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("00"),
                        buildButton("."),
                        buildButton("=", Color(0xFF525283), Color(0xFFFFFFFF)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
