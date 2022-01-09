import 'package:flutter/material.dart';
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

  Future<void> checkState() async {
    await SharedPreferences.getInstance().then((value) {
      calculatorModeView = value.getInt('calculator_mode') ?? 0;
      if (calculatorModeView != 0) {
        calculatorMode.toggleMode(CalculatorModeEnum.advanced);
      }
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
            title: Text('Calculator',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary)),
          ),
          body: body),
    );
  }
}
