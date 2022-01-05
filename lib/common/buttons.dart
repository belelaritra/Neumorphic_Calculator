import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui/button.dart';
import '../ui/button_oval.dart';
import '../ui/enlarged_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.height,
    required this.width,
    required this.ref,
  }) : super(key: key);

  final double height;
  final double width;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildButtonOval(
                  '√x',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButtonOval(
                  '^',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButtonOval(
                  'e',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButtonOval(
                  '%',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton(
                  'AC',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.background,
                  const Color(0xFFFF7B7B),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '±',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '÷',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  'x',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground)
            ],
          ),
          Row(
            children: <Widget>[
              buildButton(
                  '7',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '8',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '9',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '-',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground)
            ],
          ),
          Row(
            children: <Widget>[
              buildButton(
                  '4',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '5',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '6',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '+',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton(
                  '1',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '2',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '3',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '⌫',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.background,
                  const Color(0xFFFF7B7B),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
            ],
          ),
          Row(
            children: <Widget>[
              buildEnlargedButton(
                  '0',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '.',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildButton(
                  '=',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.onError.withOpacity(0.7),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
            ],
          )
        ],
      ),
    );
  }
}
