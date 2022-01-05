import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[300],
        iconTheme: const IconThemeData(
          color: Color(0xFF525283),
        ),
        titleTextStyle: const TextStyle(
          color: Color(0xFF525283),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.black,
        ),
      ),
      colorScheme: ColorScheme(
          primary: const Color(0xFFDBDBF9),
          primaryVariant: const Color(0xFFDBDBF9),  //using this for button background
          secondary: const Color(0xFF7F7FA5),  //using this button text
          secondaryVariant: const Color(0xFF7F7FA5),
          surface: const Color(0xFFFFFFFF),
          background: const Color(0xFFFFFFFF),
          error: const Color(0xFFff0000),
          onPrimary: const Color(0xFFDBDBF9),
          onSecondary: const Color(0xFF262636),
          onSurface: Colors.white, //using this as upper shadow color
          onBackground: Colors.blueGrey.shade200, //using this as lower shadow color
          onError: const Color(0xFFFFFFFF),
          brightness: Brightness.light));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme(
          primary: Color(0xFF1a1a26),
          primaryVariant: Color(0xFF262636),
          secondary: Color(0xFFDBDBF9),
          secondaryVariant: Color(0xFFDBDBF9),
          surface: Color(0x00000000),
          background: Color(0x00000000),
          error: Color(0xFFff0000),
          onPrimary: Color(0xFFDBDBF9),
          onSecondary: Color(0xFF262636),
          onSurface: Color(0xFF1f1f1f),
          onBackground: Color(0xFF050505),
          onError: Color(0xFFFFFFFF),
          brightness: Brightness.dark));
}
