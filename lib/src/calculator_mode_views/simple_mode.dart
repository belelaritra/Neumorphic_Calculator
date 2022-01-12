import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../common/simple_mode/box_shadow.dart';
import '../ui/simple_mode/buttons.dart';

class SimpleMode extends ConsumerWidget {
  const SimpleMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: height < 700 ? height * 0.005 : height * 0.01,
                bottom: height < 700 ? height * 0.02 : height * 0.03,
                left: width < 390 ? width * 0.035 : width * 0.06,
                right: width < 390 ? width * 0.035 : width * 0.06),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.025, vertical: height * 0.0015),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  boxShadow1(Theme.of(context).colorScheme.onBackground),
                  boxShadow2(Theme.of(context).colorScheme.onSurface)
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final history = ref.watch(historyProvider.state).state;
                      return Align(
                        alignment: Alignment.topRight,
                        child: SelectableText(
                          history,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFF7F7FA5)),
                        ),
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final expression =
                          ref.watch(expressionProvider.state).state;
                      return Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: SelectableText(
                            expression,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 28,
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
          ),
        ),
        Buttons(height: height, width: width, ref: ref),
      ],
    );
  }
}
