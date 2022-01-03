import 'package:flutter/material.dart';

import 'common/box_shadow.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String operand = "";
  String _history = '';
  String _expression = '';

  buttonPressed(String btnVal) {
    if (btnVal == "AC") {
      setState(() {
        _history = '';
        _expression = '';
      });
    } else if (btnVal == "⌫") {
      setState(() {
        //_expression = '';
        _expression = _expression.substring(0, _expression.length - 1);
      });
    } else if (btnVal == "=") {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setState(() {
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
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
    }
  }

  Widget buildButton(String buttonVal, double height, double width,
      [Color buttoncolor = const Color(0xFFE0E0E0),
      Color textcolor = const Color(0xFF7F7FA5)]) {
    return new Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.005, horizontal: width * 0.02),
      decoration: BoxDecoration(
        color: buttoncolor,
        shape: BoxShape.circle,
        boxShadow: [boxShadow1(), boxShadow2()],
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(22.0),
        child: Text(
          buttonVal,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textcolor,
          ),
        ),
        onPressed: () => buttonPressed(buttonVal),
      ),
    ));
  }

  Widget buildButtonoval(String buttonVal, double height, double width,
      [Color buttoncolor = const Color(0xFFDBDBF9),
      Color textcolor = const Color(0xFF7F7FA5)]) {
    return new Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.005, horizontal: width * 0.02),
      decoration: BoxDecoration(
        color: buttoncolor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [boxShadow1(), boxShadow2()],
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        child: Text(
          buttonVal,
          style: TextStyle(
              color: textcolor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonVal),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _expression,
                          style: TextStyle(
                              fontSize: _expression.length <= 11 ? 55 : 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF41416E)),
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '=',
                    style: TextStyle(fontSize: 35, color: Color(0xFF7F7FA5)),
                  ),
                  Expanded(
                    child: Text(
                      _history,
                      style: TextStyle(fontSize: 20, color: Color(0xFF7F7FA5)),
                    ),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButtonoval("√x", height, width),
                        buildButtonoval("^", height, width),
                        buildButtonoval("e", height, width),
                        buildButtonoval("%", height, width),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("AC", height, width, Color(0xFFDBDBF9)),
                        buildButton("±", height, width, Color(0xFFDBDBF9)),
                        buildButton("÷", height, width, Color(0xFFDBDBF9)),
                        buildButton("⌫", height, width, Color(0xFFF8C6C6),
                            Color(0xFFFF7B7B)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          "7",
                          height,
                          width,
                        ),
                        buildButton(
                          "8",
                          height,
                          width,
                        ),
                        buildButton(
                          "9",
                          height,
                          width,
                        ),
                        buildButton("x", height, width, Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          "4",
                          height,
                          width,
                        ),
                        buildButton(
                          "5",
                          height,
                          width,
                        ),
                        buildButton(
                          "6",
                          height,
                          width,
                        ),
                        buildButton("-", height, width, Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          "1",
                          height,
                          width,
                        ),
                        buildButton(
                          "2",
                          height,
                          width,
                        ),
                        buildButton(
                          "3",
                          height,
                          width,
                        ),
                        buildButton("+", height, width, Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          "0",
                          height,
                          width,
                        ),
                        buildButton(
                          "00",
                          height,
                          width,
                        ),
                        buildButton(
                          ".",
                          height,
                          width,
                        ),
                        buildButton("=", height, width, Color(0xFF525283),
                            Color(0xFFFFFFFF)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
