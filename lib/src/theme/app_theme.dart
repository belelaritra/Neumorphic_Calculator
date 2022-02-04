import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      colorScheme: ColorScheme(
          primary: const Color(0xFFDBDBF9), //using this for button background
          secondary: const Color(0xFF4d4d6e), //using this button text
          surface: const Color(
              0xFF8686b2), //using this as equals to button background
          background: const Color(0xFFF8C6C6), //using this as clear button
          error: const Color(0xFFff0000),
          onPrimary: const Color(0xFFDBDBF9),
          onSecondary: const Color(0xFF262636),
          onSurface: Colors.white, //using this as upper shadow color
          onBackground:
              Colors.blueGrey.shade200, //using this as lower shadow color
          onError:
              const Color(0xFFFFFFFF), //using this as equals to button text
          brightness: Brightness.light));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme(
          primary: Color(0xFF12121a),
          secondary: Color(0xFFDBDBF9),
          surface: Color(0xFF30304e),
          background: Color(0xFF291d1d),
          error: Color(0xFFff0000),
          onPrimary: Color(0xFFDBDBF9),
          onSecondary: Color(0xFF262636),
          onSurface: Color(0xFF1f1f1f),
          onBackground: Color(0xFF050505),
          onError: Color(0xFFFFFFFF),
          brightness: Brightness.dark));
}
