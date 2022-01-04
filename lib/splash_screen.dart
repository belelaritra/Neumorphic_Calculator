import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/app.dart';
import 'main.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool hapticFeedback = true;

  void navigateToCalculator(bool hapticFeedback) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CalculatorApp(),
      ),
    );
  }

  Future<void> checkHapticFeedback() async {
    await SharedPreferences.getInstance().then((value) {
      hapticFeedback = value.getBool('haptic_feedback') ?? true;
      ref.read(hapticFeedbackProvider.state).state = hapticFeedback;
      navigateToCalculator(hapticFeedback);
    });
  }

  @override
  void initState() {
    super.initState();
    checkHapticFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center());
  }
}
