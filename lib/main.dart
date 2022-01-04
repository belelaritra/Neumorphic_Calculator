import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

final expressionProvider = StateProvider((ref) => '');
final historyProvider = StateProvider((ref) => '');

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: CalculatorApp())));
}
