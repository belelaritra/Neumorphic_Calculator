import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../ui/common_drawer.dart';
import 'advanced_mode.dart';
import 'calculator_mode.dart';
import 'simple_mode.dart';

class CalculatorModeViewRebuilder extends ConsumerStatefulWidget {
  const CalculatorModeViewRebuilder({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalculatorModeViewRebuilderState();
}

class _CalculatorModeViewRebuilderState
    extends ConsumerState<CalculatorModeViewRebuilder> {
  late Widget body;
  late int calculatorModeView;
  late final SharedPreferences _prefs;

  Future<void> checkState() async {
    await SharedPreferences.getInstance().then((value) {
      calculatorModeView = value.getInt('calculator_mode') ?? 0;
      if (calculatorModeView != 0) {
        calculatorMode.toggleMode(CalculatorModeEnum.advanced);
      }
      _prefs = value;
    });
  }

  @override
  void initState() {
    super.initState();
    calculatorMode.addListener(() {
      setState(() {
        body = calculatorMode.getCalculatorMode == CalculatorModeEnum.simple
            ? const SimpleMode()
            : const AdvancedMode();
      });
    });
    checkState();
    body = const SimpleMode();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: SizedBox(
            width: width / 1.6,
            child: const CommonDrawer(),
          ),
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NeumorphicButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shadowDarkColor: Theme.of(context).colorScheme.onBackground,
                    shadowLightColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              );
            }),
            title: Text('Calculator',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary)),
            actions: [
              Consumer(
                builder: (context, ref, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: calculatorMode.getCalculatorMode !=
                            CalculatorModeEnum.simple
                        ? NeumorphicButton(
                            style: NeumorphicStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              shadowDarkColor:
                                  Theme.of(context).colorScheme.onBackground,
                              shadowLightColor:
                                  Theme.of(context).colorScheme.onSurface,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10)),
                            ),
                            onPressed: () async {
                              await _prefs.setBool('is_radian',
                                  !ref.watch(radianProvider.state).state);
                              ref.watch(radianProvider.state).state =
                                  !ref.watch(radianProvider.state).state;
                            },
                            child: Center(
                              child: Text(
                                  ref.watch(radianProvider.state).state
                                      ? 'RAD'
                                      : 'DEG',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                            ))
                        : null,
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
                child: NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shadowDarkColor: Theme.of(context).colorScheme.onBackground,
                    shadowLightColor: Theme.of(context).colorScheme.onSurface,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Center(child: Icon(Icons.history_toggle_off)),
                ),
              )
            ],
          ),
          body: body),
    );
  }
}
