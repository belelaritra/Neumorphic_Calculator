import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '/common/box_shadow.dart';
import '../main.dart';
import '../utils/button_press.dart';

Widget buildButtonOval(
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
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.01),
      child: Text(
        buttonVal,
        style: TextStyle(
            color: textcolor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if (ref.watch(hapticFeedbackProvider.state).state) {
          Vibrate.feedback(FeedbackType.success);
        }
        buttonPress.buttonPressed(buttonVal, ref);
      },
    ),
  );
}
