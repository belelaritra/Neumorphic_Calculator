import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../main.dart';

class ButtonPress {
  ButtonPress() {
    cm.bindVariable(pi, Number(math.pi));
  }

  String operand = '';
  String _history = '';
  String _expression = '';
  Variable pi = Variable('π');
  Variable euler = Variable('e');

  final Parser p = Parser();
  late Expression exp;
  final ContextModel cm = ContextModel();

  final fiveOperations = RegExp(r'(\+|\*|-|/|\^)$');
  final fourOperations = RegExp(r'(\+|\*|/|\^)$'); //excluding subtraction
  final numbersEulerPi = RegExp(r'[0-9]$|π$|e$');
  final numbers = RegExp(r'[0-9]');
  final piEuler = RegExp(r'(π|e)$');
  final sinTanCos = RegExp(r'(sin|cos|tan)$');
  final plusMinus = RegExp(r'^-');
  final logLn = RegExp(r'(log|ln)$');
  final bracketEnd = RegExp(r'\)$');

  int bracketCount = 0;

  buttonPressed(String btnVal, WidgetRef ref) {
    try {
      if (btnVal == 'C') {
        _history = _expression;
        _expression = '';
        bracketCount = 0;
        ref.read(expressionProvider.state).state = _expression;
        ref.read(historyProvider.state).state = _history;
      } else if (btnVal == '<-') {
        if (_expression.isNotEmpty) {
          if (_expression[_expression.length - 1] == ')') {
            bracketCount++;
          } else if (_expression[_expression.length - 1] == '(') {
            bracketCount--;
          }
          _expression = _expression.substring(0, _expression.length - 1);
          ref.read(expressionProvider.state).state = _expression;
        }
      } else if (btnVal == '=') {
        if (bracketCount > 0) {
          for (int i = 0; i < bracketCount; i++) {
            _expression += ')';
          }
          ref.read(expressionProvider.state).state = _expression;
        }
        ref.read(historyProvider.state).state = _expression;
        _expression = _expression.replaceAll('e', '2.718281828459045');
        _expression = _expression.replaceAll('log(', 'log(10, ');
        exp = p.parse(_expression);
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();

        _expression = _expression.endsWith('.0')
            ? _expression.substring(0, _expression.length - 2)
            : _expression;
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '±') {
        if (_expression.isNotEmpty) {
          if (plusMinus.hasMatch(_expression)) {
            _expression = _expression.substring(1);
          } else {
            _expression = '-$_expression';
          }
          ref.read(expressionProvider.state).state = _expression;
        }
      } else if (btnVal == 'π' || btnVal == 'e') {
        if (numbersEulerPi.hasMatch(_expression)) {
          _expression = '$_expression*$btnVal';
        } else {
          _expression += btnVal;
        }
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == 'EXP') {
        _expression = '$_expression*10^(';
        bracketCount++;
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '%') {
        if (_expression.isNotEmpty) {
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
              leftHandExp =
                  p.parse(_expression.substring(0, _subStringIndex[0]));
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
        }
      } else if (logLn.hasMatch(btnVal)) {
        if (numbersEulerPi.hasMatch(_expression) ||
            bracketEnd.hasMatch(_expression)) {
          _expression = '$_expression*$btnVal(';
          bracketCount++;
        } else {
          _expression = '$_expression$btnVal(';
          bracketCount++;
        }
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == '(') {
        bracketCount++;
        _expression = '$_expression$btnVal';
        ref.read(expressionProvider.state).state = _expression;
      } else if (btnVal == ')') {
        if (bracketCount > 0) {
          bracketCount--;
          _expression = '$_expression$btnVal';
          ref.read(expressionProvider.state).state = _expression;
        }
      } else if (btnVal == '!' && _expression.isEmpty) {
        if (ref.watch(hapticFeedbackProvider.state).state) {
          Vibrate.feedback(FeedbackType.error);
        }
      } else if (sinTanCos.hasMatch(btnVal)) {
        if (numbersEulerPi.hasMatch(_expression) ||
            bracketEnd.hasMatch(_expression)) {
          _expression = '$_expression*$btnVal(';
          bracketCount++;
        } else {
          _expression = '$_expression$btnVal(';
          bracketCount++;
        }
        ref.read(expressionProvider.state).state = _expression;
      } else if (numbers.hasMatch(btnVal) && piEuler.hasMatch(_expression)) {
        _expression = '$_expression*$btnVal';
        ref.read(expressionProvider.state).state = _expression;
      } else {
        if (_expression.isNotEmpty) {
          if (fiveOperations.hasMatch(btnVal) &&
              fiveOperations.hasMatch(_expression)) {
            //empty expression
            if (fourOperations.hasMatch(_expression) && btnVal == '-') {
              _expression = '$_expression-';
            } else {
              if (ref.watch(hapticFeedbackProvider.state).state) {
                Vibrate.feedback(FeedbackType.error);
              }
            }
          } else {
            _expression += btnVal;
          }
        } else if (fiveOperations.hasMatch(btnVal)) {
          //expression is not empty
          if (btnVal == '-') {
            _expression = '-$_expression';
          } else {
            if (ref.watch(hapticFeedbackProvider.state).state) {
              Vibrate.feedback(FeedbackType.error);
            }
          }
        } else {
          _expression += btnVal;
        }
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
