import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_screen.dart';

final expressionProvider = StateProvider((ref) => '');
final historyProvider = StateProvider((ref) => '');
final hapticFeedbackProvider = StateProvider((ref) => true);

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen())));
}
