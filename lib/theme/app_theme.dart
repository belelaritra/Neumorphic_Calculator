import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      colorScheme: ColorScheme(
          primary: const Color(0xFFDBDBF9), //using this for button background
          primaryVariant: const Color(0xFFDBDBF9),
          secondary: const Color(0xFF4d4d6e), //using this button text
          secondaryVariant: const Color(0xFF4d4d6e),
          surface: const Color(
              0xFF7777a9), //using this as equals to button background
          background: const Color(0xFFF8C6C6),  //using this as clear button
          error: const Color(0xFFff0000),
          onPrimary: const Color(0xFFDBDBF9),
          onSecondary: const Color(0xFF262636),
          onSurface: Colors.white, //using this as upper shadow color
          onBackground:
              Colors.blueGrey.shade200, //using this as lower shadow color
          onError: const Color(0xFFFFFFFF), //using this as equals to button text
          brightness: Brightness.light));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme(
          primary: Color(0xFF1a1a26),
          primaryVariant: Color(0xFF262636),
          secondary: Color(0xFFDBDBF9),
          secondaryVariant: Color(0xFFDBDBF9),
          surface: Color(0xFF30304e),
          background: Color(0xFF8d6363),
          error: Color(0xFFff0000),
          onPrimary: Color(0xFFDBDBF9),
          onSecondary: Color(0xFF262636),
          onSurface: Color(0xFF1f1f1f),
          onBackground: Color(0xFF050505),
          onError: Color(0xFFFFFFFF),
          brightness: Brightness.dark));
}
