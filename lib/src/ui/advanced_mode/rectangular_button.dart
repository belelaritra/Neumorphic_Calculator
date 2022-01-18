import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../../main.dart';
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
  return SizedBox(
    width: width * 0.215,
    child: NeumorphicButton(
      margin: EdgeInsets.only(
          top: height * 0.006, bottom: height * 0.006, right: width * 0.02),
      style: NeumorphicStyle(
        color: buttoncolor,
        shadowDarkColor: lowerShadow,
        shadowLightColor: upperShadow,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
      child: Center(
        child: Text(
          buttonVal,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: textcolor.withOpacity(0.7),
          ),
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
