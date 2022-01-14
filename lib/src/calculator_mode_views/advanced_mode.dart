import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../common/advanced_mode/box_shadow.dart';
import '../ui/advanced_mode/buttons.dart';

class AdvancedMode extends ConsumerWidget {
  const AdvancedMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: height < 700 ? height * 0.007 : height * 0.03,
                bottom: height < 700 ? height * 0.04 : height * 0.03,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      final expression =
                          ref.watch(expressionProvider.state).state;
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
          ),
        ),
        Buttons(height: height, width: width, ref: ref),
      ],
    );
  }
}
