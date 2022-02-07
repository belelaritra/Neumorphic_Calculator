import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class CalculationDisplay extends ConsumerWidget {
  const CalculationDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.003,
          bottom: height * 0.015,
          left: width * 0.035,
          right: width * 0.035),
      child: Neumorphic(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.002, horizontal: width * 0.03),
        style: NeumorphicStyle(
          depth: -5,
          color: Theme.of(context).scaffoldBackgroundColor,
          shadowDarkColorEmboss: Theme.of(context).colorScheme.onBackground,
          shadowLightColorEmboss: Theme.of(context).colorScheme.onSurface,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final history = ref.watch(historyProvider.state).state;
                return Align(
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    reverse: ref
                        .watch(calculatorDisplayDirectionProvider.state)
                        .state,
                    scrollDirection: Axis.horizontal,
                    child: SelectableText(
                      history,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 25, color: Color(0xFF7F7FA5)),
                    ),
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final expression = ref.watch(expressionProvider.state).state;
                return Container(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    reverse: ref
                        .watch(calculatorDisplayDirectionProvider.state)
                        .state,
                    scrollDirection: Axis.horizontal,
                    child: SelectableText(
                      expression,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
