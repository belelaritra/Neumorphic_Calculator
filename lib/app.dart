import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'ui/button.dart';
import 'ui/button_oval.dart';

class CalculatorApp extends ConsumerStatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends ConsumerState<CalculatorApp> {
  late final _prefs;

  Future<void> loadSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreferencesInstance();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF525283),
            title: const Text('Calculator'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Settings'),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          content: Row(
                            children: [
                              const Text('Haptic Feedback'),
                              Consumer(
                                builder: (context, ref, _) {
                                  return Checkbox(
                                    value: ref
                                        .watch(hapticFeedbackProvider.state)
                                        .state,
                                    onChanged: (bool? value) async {
                                      await _prefs.setBool(
                                          'haptic_feedback', value);
                                      ref
                                          .watch(hapticFeedbackProvider.state)
                                          .state = value!;
                                    },
                                  );
                                },
                              )
                            ],
                          )));
                },
              ),
            ],
          ),
          backgroundColor: Colors.grey[300],
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Consumer(
                        builder: (context, ref, _) {
                          final history =
                              ref.watch(historyProvider.state).state;
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              history,
                              style: const TextStyle(
                                  fontSize: 20, color: Color(0xFF7F7FA5)),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '=',
                          style:
                              TextStyle(fontSize: 35, color: Color(0xFF7F7FA5)),
                        ),
                        Consumer(
                          builder: (context, ref, _) {
                            final expression =
                                ref.watch(expressionProvider.state).state;
                            return Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  expression,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize:
                                          expression.length <= 11 ? 55 : 40,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF41416E)),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildButtonOval('√x', height, width, ref),
                        buildButtonOval('^', height, width, ref),
                        buildButtonOval('e', height, width, ref),
                        buildButtonOval('%', height, width, ref),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                            'AC', height, width, ref, const Color(0xFFDBDBF9)),
                        buildButton(
                            '±', height, width, ref, const Color(0xFFDBDBF9)),
                        buildButton(
                            '÷', height, width, ref, const Color(0xFFDBDBF9)),
                        buildButton('⌫', height, width, ref,
                            const Color(0xFFF8C6C6), const Color(0xFFFF7B7B)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          '7',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '8',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '9',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                            'x', height, width, ref, const Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          '4',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '5',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '6',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                            '-', height, width, ref, const Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          '1',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '2',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '3',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                            '+', height, width, ref, const Color(0xFFDBDBF9))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton(
                          '0',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '00',
                          height,
                          width,
                          ref,
                        ),
                        buildButton(
                          '.',
                          height,
                          width,
                          ref,
                        ),
                        buildButton('=', height, width, ref,
                            const Color(0xFF525283), const Color(0xFFFFFFFF)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
