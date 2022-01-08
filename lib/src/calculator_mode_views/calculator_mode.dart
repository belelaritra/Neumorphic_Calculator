import 'package:flutter/cupertino.dart';

class CalculatorMode extends ChangeNotifier {
  bool _isAdvanced = false;
  bool get isAdvanced => _isAdvanced;

  void toggleMode() {
    _isAdvanced = !_isAdvanced;
    notifyListeners();
  }
}
