import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/common/box_shadow.dart';
import '../button_press.dart';

Widget buildButtonoval(
    String buttonVal, double height, double width, WidgetRef ref,
    [Color buttoncolor = const Color(0xFFDBDBF9),
    Color textcolor = const Color(0xFF7F7FA5)]) {
  return Container(
    width: width * 0.2,
    height: height * 0.08,
    margin: EdgeInsets.symmetric(
        vertical: height * 0.005, horizontal: width * 0.02),
    decoration: BoxDecoration(
      color: buttoncolor,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [boxShadow1(), boxShadow2()],
    ),
    child: MaterialButton(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.01),
      child: Text(
        buttonVal,
        style: TextStyle(
            color: textcolor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      onPressed: () => buttonPress.buttonPressed(buttonVal, ref),
    ),
  );
}
