import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../../main.dart';
import '../../utils/button_press.dart';

Widget buildCircleButton(
  String buttonVal,
  double height,
  double width,
  WidgetRef ref,
  Color buttoncolor,
  Color textcolor,
  Color upperShadow,
  Color lowerShadow,
) {
  return Expanded(
      child: NeumorphicButton(
    margin: EdgeInsets.symmetric(
        vertical: height * 0.005, horizontal: width * 0.02),
    style: NeumorphicStyle(
      color: buttoncolor,
      shadowDarkColor: lowerShadow,
      shadowLightColor: upperShadow,
      boxShape: const NeumorphicBoxShape.circle(),
    ),
    padding: const EdgeInsets.all(24.0),
    child: Center(
      child: Text(
        buttonVal,
        style: TextStyle(
          fontSize: 20.0,
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
  ));
}
