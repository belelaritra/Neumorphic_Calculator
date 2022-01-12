import 'package:flutter/cupertino.dart';

enum CalculatorModeEnum {
  simple,
  advanced,
}

class CalculatorMode extends ChangeNotifier {
  CalculatorModeEnum _mode = CalculatorModeEnum.simple;
  CalculatorModeEnum get getCalculatorMode => _mode;

  void toggleMode(CalculatorModeEnum _calculatorModeEnum) {
    _mode = _calculatorModeEnum;
    notifyListeners();
  }
}
