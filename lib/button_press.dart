import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

import 'main.dart';

class ButtonPress {
  String operand = '';
  String _history = '';
  String _expression = '';

  buttonPressed(String btnVal, WidgetRef ref) {
    if (btnVal == 'AC') {
      _history = '';
      _expression = '';

      ref.read(historyProvider.state).state = _history;
      ref.read(expressionProvider.state).state = _expression;
    } else if (btnVal == '⌫') {
      _expression = _expression.substring(0, _expression.length - 1);
      ref.read(expressionProvider.state).state = _expression;
    } else if (btnVal == '=') {
      final Parser p = Parser();
      final Expression exp = p.parse(_expression);
      final ContextModel cm = ContextModel();

      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();

      ref.read(expressionProvider.state).state = _expression;
      ref.read(historyProvider.state).state = _history;
    } else if (btnVal == '±') {
      const int a = -1;
      final int res = a * int.parse(_expression);
      _expression = res.toString();
      ref.read(expressionProvider.state).state = _expression;
    } else if (btnVal == '√x') {
      final Power xSquare = Power(_expression, 0.5);
      _expression = xSquare.toString();
      ref.read(expressionProvider.state).state = _expression;
    } else if (btnVal == '%') {
      final double result = double.parse(_expression) * 0.01;
      _expression = result.toString();
      ref.read(expressionProvider.state).state = _expression;
    } else {
      if (btnVal == 'x') {
        btnVal = '*';
      } else if (btnVal == '÷') {
        btnVal = '/';
      }
      _expression = _expression + btnVal;
      ref.read(expressionProvider.state).state = _expression;
    }
  }
}

ButtonPress buttonPress = ButtonPress();
