import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'ui/button.dart';
import 'ui/button_oval.dart';
import 'ui/enlarged_button.dart';
import 'utils/url_launcher.dart';

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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: SizedBox(
            width: width / 1.6,
            child: Drawer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.025, right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: const Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF525283)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: Container(
                        height: height * 0.08,
                        padding: EdgeInsets.only(left: width * 0.05),
                        decoration: BoxDecoration(
                            color: const Color(0xFF525283).withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Haptic Feedback',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF525283))),
                            Consumer(
                              builder: (context, ref, _) {
                                return Checkbox(
                                  shape: const CircleBorder(),
                                  checkColor: const Color(0xFF525283),
                                  activeColor: const Color(0xFFDBDBF9),
                                  side: const BorderSide(
                                    color: Color(0xFF525283),
                                  ),
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.018),
                      child: Container(
                        height: height * 0.08,
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        decoration: BoxDecoration(
                            color: const Color(0xFF525283).withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Theme',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF525283))),
                            Consumer(
                              builder: (context, ref, _) {
                                return Row(children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      themeController
                                          .changeTheme(ThemeMode.system);
                                      await _prefs.setInt('theme_mode', 0);
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: themeController.currentTheme ==
                                                  ThemeMode.system
                                              ? const Color(0xFF525283)
                                              : const Color(0xFFE0E0E0),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.screenshot,
                                            size: 20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        themeController
                                            .changeTheme(ThemeMode.light);
                                        await _prefs.setInt('theme_mode', 1);
                                      },
                                      child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color:
                                                themeController.currentTheme ==
                                                        ThemeMode.light
                                                    ? const Color(0xFF525283)
                                                    : const Color(0xFFE0E0E0),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.wb_sunny,
                                              size: 20)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      themeController
                                          .changeTheme(ThemeMode.dark);
                                      await _prefs.setInt('theme_mode', 2);
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: themeController.currentTheme ==
                                                  ThemeMode.dark
                                              ? const Color(0xFF525283)
                                              : const Color(0xFFE0E0E0),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.brightness_3,
                                            size: 20)),
                                  ),
                                ]);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.018),
                      child: Container(
                        height: height * 0.08,
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        decoration: BoxDecoration(
                            color: const Color(0xFF525283).withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: InkWell(
                          onTap: () => launchURL(),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: Color(0xFF525283),
                              ),
                              Text('      About',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF525283))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            title: const Text('Calculator'),
          ),
          body: Column(
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
                      gradient: LinearGradient(
                        begin: const Alignment(-1, -4),
                        end: const Alignment(1.5, 4),
                        colors: [
                          Colors.grey.withOpacity(0.3),
                          const Color(0xFFE0E0E0),
                          Colors.white.withOpacity(0.5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer(
                          builder: (context, ref, _) {
                            final history =
                                ref.watch(historyProvider.state).state;
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
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF41416E)),
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
              Padding(
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
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
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
                            '⌫',
                            height,
                            width,
                            ref,
                            const Color(0xFFF8C6C6),
                            const Color(0xFFFF7B7B),
                            Theme.of(context).colorScheme.onSurface,
                            Theme.of(context).colorScheme.onBackground),
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
                            '+',
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
                            const Color(0xFF525283),
                            const Color(0xFFFFFFFF),
                            Theme.of(context).colorScheme.onSurface,
                            Theme.of(context).colorScheme.onBackground),
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
