import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui/advanced_mode/buttons.dart';
import '../ui/calculation_display.dart';

class AdvancedMode extends ConsumerWidget {
  const AdvancedMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        const Expanded(
          child: CalculationDisplay(),
        ),
        Buttons(height: height, width: width, ref: ref),
      ],
    );
  }
}
