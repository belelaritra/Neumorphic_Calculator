import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'circular_button.dart';
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
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCircleButton(
                  '⅟x',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '±',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '%',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
            children: <Widget>[
              buildCircleButton(
                  'C',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.background,
                  const Color(0xFFFF7B7B),
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '(',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  ')',
                  height,
                  width,
                  ref,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
            children: <Widget>[
              buildCircleButton(
                  '7',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '8',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '9',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
              buildCircleButton(
                  '4',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '5',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '6',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
              buildCircleButton(
                  '1',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '2',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '3',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
              buildRectangleButton(
                  '0',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
                  '.',
                  height,
                  width,
                  ref,
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.onBackground),
              buildCircleButton(
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
