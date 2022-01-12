import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rectangular_button.dart';

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
      padding: EdgeInsets.only(bottom: height * 0.01, left: width * 0.02),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  'log',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'ln',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '!',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'EXP',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  'sin',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'cos',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'tan',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'e',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  '^',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '±',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '%',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  'π',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  'C',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.background,
                  const Color(0xFFFF7B7B),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '(',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  ')',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '<-',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  '7',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '8',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '9',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '/',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  '4',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '5',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '6',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '*',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  '1',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '2',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '3',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildRectangleButton(
                  '0',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '.',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '=',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.onError.withOpacity(0.7),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildRectangleButton(
                  '+',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
            ],
          )
        ],
      ),
    );
  }
}
