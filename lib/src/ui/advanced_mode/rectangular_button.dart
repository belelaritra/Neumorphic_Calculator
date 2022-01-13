import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../../main.dart';
import '../../common/advanced_mode/box_shadow.dart';
import '../../utils/button_press.dart';

Widget buildRectangleButton(
    String buttonVal,
    double height,
    double width,
    WidgetRef ref,
    Color buttoncolor,
    Color textcolor,
    Color upperShadow,
    Color lowerShadow) {
  return Container(
    width: width * 0.2,
    margin: EdgeInsets.only(
        top: height * 0.0055, bottom: height * 0.0055, right: width * 0.02),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: buttoncolor,
      boxShadow: [boxShadow1(lowerShadow), boxShadow2(upperShadow)],
    ),
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      splashColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Text(
        buttonVal,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: textcolor.withOpacity(0.7),
        ),
      ),
      onPressed: () {
        if (ref.watch(hapticFeedbackProvider.state).state) {
          Vibrate.feedback(FeedbackType.success);
        }
        buttonPress.buttonPressed(buttonVal, ref);
      },
    ),
  );
}
