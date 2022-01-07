import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:math_expressions/math_expressions.dart';

import '../main.dart';

class ButtonPress {
  String operand = '';
  String _history = '';
  String _expression = '';
  final Parser p = Parser();
  late Expression exp;
  final ContextModel cm = ContextModel();

  buttonPressed(String btnVal, WidgetRef ref) {
    try {
      if (btnVal == 'C') {
        _history = '';
        _expression = '';
        ref.read(historyProvider.state).state = _history;
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '<-') {
        _expression = _expression.substring(0, _expression.length - 1);
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '⅟x') {
        final double reciprocal = 1 / double.parse(_expression);
        _expression = reciprocal.toString();
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '=') {
        exp = p.parse(_expression);
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
        _expression = _expression.endsWith('.0')
            ? _expression.substring(0, _expression.length - 2)
            : _expression;
        ref.read(expressionProvider.state).state = _expression;
        ref.read(historyProvider.state).state = _history;
      } else if (btnVal == '±') {
        final double res = -1 * double.parse(_expression);
        _expression = res.toString();
        _expression = _expression.endsWith('.0')
            ? _expression.substring(0, _expression.length - 2)
            : _expression;
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '%') {
        _expression = '$_expression%';
        ref.read(expressionProvider.state).state = _expression;
        final List<String> _operators = [];
        final List<int> _operatorIndex = [], _subStringIndex = [];
        final Expression leftHandExp, rightHandExp, finalExp;
        final String leftHandExpResult, rightHandExpResult;
        String _breakPoint = '';
        for (int i = _expression.length - 1; i >= 0; i--) {
          if (_expression[i] == '+' ||
              _expression[i] == '-' ||
              _expression[i] == '*' ||
              _expression[i] == '/' ||
              _expression[i] == '%' ||
              _expression[i] == '(' ||
              _expression[i] == ')') {
            _operators.add(_expression[i]);
            _operatorIndex.add(i);
          }
        }
        if (_operators.length >= 2) {
          if (_operators[1] == ')') {
            for (int i = 1; i < _operators.length; i++) {
              if (_operators[i] == '(') {
                _subStringIndex.add(_operatorIndex[i]);
                _subStringIndex.add(_operatorIndex[1]);
                _breakPoint = _operators[i + 1];
                break;
              }
            }
            rightHandExp = p.parse(_expression.substring(
                _subStringIndex[0], _subStringIndex[1] + 1));
            rightHandExpResult =
                rightHandExp.evaluate(EvaluationType.REAL, cm).toString();
            leftHandExp =
                p.parse(_expression.substring(0, _subStringIndex[0] - 1));
          } else {
            rightHandExp = p.parse(_expression.substring(
                _operatorIndex[1] + 1, _expression.length - 1));
            rightHandExpResult =
                rightHandExp.evaluate(EvaluationType.REAL, cm).toString();
            _subStringIndex.add(_operatorIndex[1]);
            leftHandExp = p.parse(_expression.substring(0, _subStringIndex[0]));
            _breakPoint = _operators[1];
          }
          leftHandExpResult =
              leftHandExp.evaluate(EvaluationType.REAL, cm).toString();
          if (_breakPoint == '-' || _breakPoint == '+') {
            finalExp = p.parse(
                '$leftHandExpResult$_breakPoint$rightHandExpResult / 100 * $leftHandExpResult');
            ref.read(historyProvider.state).state = _expression;
          } else {
            if (_breakPoint == '*') {
              finalExp =
                  p.parse('$leftHandExpResult * $rightHandExpResult / 100');
              ref.read(historyProvider.state).state = _expression;
            } else {
              finalExp =
                  p.parse('$leftHandExpResult * 100 / $rightHandExpResult');
              ref.read(historyProvider.state).state = _expression;
            }
          }
          _expression = finalExp.evaluate(EvaluationType.REAL, cm).toString();
          _expression = _expression.endsWith('.0')
              ? _expression.substring(0, _expression.length - 2)
              : _expression;
          ref.read(expressionProvider.state).state = _expression;
        } else {
          ref.read(historyProvider.state).state = _expression;
          final double percentage =
              double.parse(_expression.substring(0, _expression.length - 1)) /
                  100;
          _expression = percentage.toString();
          ref.read(expressionProvider.state).state = _expression;
        }
      } else {
        if (btnVal == 'x') {
          btnVal = '*';
        }
        _expression = _expression + btnVal;
        ref.read(expressionProvider.state).state = _expression;
      }
    } catch (_) {
      if (ref.watch(hapticFeedbackProvider.state).state) {
        Vibrate.feedback(FeedbackType.error);
      }
      ref.read(expressionProvider.state).state = 'ERROR';
      Timer(const Duration(seconds: 1),
          () => ref.read(expressionProvider.state).state = _expression);
    }
  }
}

ButtonPress buttonPress = ButtonPress();
