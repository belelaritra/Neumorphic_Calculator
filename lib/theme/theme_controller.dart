import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;

  changeTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
  }
}
