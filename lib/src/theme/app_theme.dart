import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static late ThemeData lightTheme = ThemeData(
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
          brightness: Brightness.light,
          primaryVariant: const Color(
              0xFFDBDBF9), // this was using for nothing. But was requred by ColorScheme
          secondaryVariant: const Color(
              0xFF4d4d6e) // this was using for nothing. But was requred by ColorScheme
          ));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF171616),
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
          brightness: Brightness.dark,
          primaryVariant: Color(0xFF12121a),
          secondaryVariant: Color(0xFFDBDBF9)));

  // Used to fix light theme when the custom theme overwrite it
  static final ThemeData customTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      colorScheme: ColorScheme(
          primary: const Color(0xFFDBDBF9),
          secondary: const Color(0xFF4d4d6e),
          surface: const Color(0xFF8686b2),
          background: const Color(0xFFF8C6C6),
          error: const Color(0xFFff0000),
          onPrimary: const Color(0xFFDBDBF9),
          onSecondary: const Color(0xFF262636),
          onSurface: Colors.white,
          onBackground: Colors.blueGrey.shade200,
          onError: const Color(0xFFFFFFFF),
          brightness: Brightness.light,
          primaryVariant: const Color(0xFFDBDBF9),
          secondaryVariant: const Color(0xFF4d4d6e)));
}
