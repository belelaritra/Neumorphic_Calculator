import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../calculator_mode_views/calculator_mode.dart';
import '../theme/app_theme.dart';
import '../utils/url_launcher.dart';

class CommonDrawer extends ConsumerStatefulWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends ConsumerState<CommonDrawer> {
  late final _prefs;

  Color pickerColor = const Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future<void> loadSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreferencesInstance();
  }

  //style for the common drawer containers
  NeumorphicStyle get customNeumorphicStyle => NeumorphicStyle(
        depth: 5,
        color: Theme.of(context).scaffoldBackgroundColor,
        shadowLightColor: Theme.of(context).colorScheme.onBackground,
        shadowDarkColor: Theme.of(context).colorScheme.onSurface,
        boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
            topRight: Radius.circular(100.0),
            bottomRight: Radius.circular(100.0))),
      );

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.025, right: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.018),
              child: Neumorphic(
                style: customNeumorphicStyle,
                child: Container(
                  height: height * 0.07,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(100.0),
                          bottomRight: Radius.circular(100.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calculate_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Text(
                              '      ${AppLocalizations.of(context)!.advanced}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                        ],
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          return Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: Checkbox(
                              shape: const CircleBorder(),
                              checkColor:
                                  Theme.of(context).colorScheme.secondary,
                              activeColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              value: calculatorMode.getCalculatorMode ==
                                  CalculatorModeEnum.advanced,
                              onChanged: (bool? value) async {
                                if (ref
                                    .watch(hapticFeedbackProvider.state)
                                    .state) {
                                  Vibrate.feedback(FeedbackType.success);
                                }
                                Navigator.of(context).pop();
                                await _prefs.setInt(
                                    'calculator_mode', value! ? 1 : 0);
                                calculatorMode.toggleMode(
                                    calculatorMode.getCalculatorMode ==
                                            CalculatorModeEnum.advanced
                                        ? CalculatorModeEnum.simple
                                        : CalculatorModeEnum.advanced);
                              },
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
              padding: EdgeInsets.only(bottom: height * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      AppLocalizations.of(context)!.settings,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.018),
                    child: Neumorphic(
                      style: customNeumorphicStyle,
                      child: Container(
                        height: height * 0.07,
                        padding: EdgeInsets.only(left: width * 0.05),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppLocalizations.of(context)!.hapticFeedback,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            Consumer(
                              builder: (context, ref, _) {
                                return Padding(
                                  padding: EdgeInsets.only(right: width * 0.05),
                                  child: Checkbox(
                                    shape: const CircleBorder(),
                                    checkColor:
                                        Theme.of(context).colorScheme.secondary,
                                    activeColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    value: ref
                                        .watch(hapticFeedbackProvider.state)
                                        .state,
                                    onChanged: (bool? value) async {
                                      Navigator.of(context).pop();
                                      await _prefs.setBool(
                                          'haptic_feedback', value);
                                      ref
                                          .watch(hapticFeedbackProvider.state)
                                          .state = value!;
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.018),
                    child: Neumorphic(
                      style: customNeumorphicStyle,
                      child: Container(
                        height: height * 0.07,
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppLocalizations.of(context)!.theme,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            Consumer(
                              builder: (context, ref, _) {
                                return Row(children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (ref
                                          .watch(hapticFeedbackProvider.state)
                                          .state) {
                                        Vibrate.feedback(FeedbackType.success);
                                      }
                                      Navigator.of(context).pop();
                                      themeController
                                          .changeTheme(ThemeMode.system);
                                      await _prefs.setInt('theme_mode', 0);
                                    },
                                    child: Icon(
                                      Icons.screenshot,
                                      color: themeController.currentTheme ==
                                              ThemeMode.system
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (ref
                                            .watch(hapticFeedbackProvider.state)
                                            .state) {
                                          Vibrate.feedback(
                                              FeedbackType.success);
                                        }
                                        AppTheme.lightTheme =
                                            AppTheme.customTheme;
                                        Navigator.of(context).pop();
                                        themeController
                                            .changeTheme(ThemeMode.light);
                                        await _prefs.setInt('theme_mode', 1);
                                      },
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: themeController.currentTheme ==
                                                ThemeMode.light
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context)
                                                .colorScheme
                                                .surface,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (ref
                                          .watch(hapticFeedbackProvider.state)
                                          .state) {
                                        Vibrate.feedback(FeedbackType.success);
                                      }
                                      Navigator.of(context).pop();
                                      themeController
                                          .changeTheme(ThemeMode.dark);
                                      await _prefs.setInt('theme_mode', 2);
                                    },
                                    child: Icon(
                                      Icons.brightness_3,
                                      color: themeController.currentTheme ==
                                              ThemeMode.dark
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                    ),
                                  ),
                                ]);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.018),
                    child: Neumorphic(
                      style: customNeumorphicStyle,
                      child: Container(
                          height: height * 0.07,
                          padding: EdgeInsets.only(
                              left: width * 0.05, right: width * 0.05),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Custom Theme',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                Consumer(builder: (context, ref, _) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (ref
                                          .watch(hapticFeedbackProvider.state)
                                          .state) {
                                        Vibrate.feedback(FeedbackType.success);
                                      }
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title:
                                                    const Text('Pick a color!'),
                                                content: SingleChildScrollView(
                                                  child: HueRingPicker(
                                                    pickerColor: pickerColor,
                                                    onColorChanged: changeColor,
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  FloatingActionButton(
                                                    heroTag: 'save',
                                                    foregroundColor:
                                                        Colors.black,
                                                    backgroundColor:
                                                        Colors.white,
                                                    onPressed: () {
                                                      setDarkTheme(pickerColor);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Icon(
                                                      Icons.check,
                                                      size: 20,
                                                    ),
                                                  )
                                                ]);
                                          }).then((_) async {
                                        Navigator.of(context).pop();
                                        themeController
                                            .changeTheme(ThemeMode.system);
                                        await _prefs.setInt('theme_mode', 0);
                                      });
                                    },
                                    child: Icon(
                                      Icons.color_lens,
                                      color: themeController.currentTheme ==
                                              ThemeMode.system
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                    ),
                                  );
                                })
                              ])),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.018),
                    child: Neumorphic(
                      style: customNeumorphicStyle,
                      child: Container(
                        height: height * 0.07,
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0))),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => launchURL(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                  '      ${AppLocalizations.of(context)!.about}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setDarkTheme(Color color) {
    AppTheme.lightTheme = ThemeData(
        scaffoldBackgroundColor: color,
        colorScheme: const ColorScheme(
            primary: Color(0xFF12121a),
            secondary: Color(0xFFDBDBF9),
            surface: Color(0xFF30304e),
            background: Color(0xFF291d1d),
            error: Color(0xFFff0000),
            onPrimary: Color(0xFFDBDBF9),
            onSecondary: Color(0xFF262636),
            onSurface: Color(0xFF1f1f1f),
            onBackground: Color(0xFF050505),
            onError: Color(0xFFFFFFFF),
            brightness: Brightness.dark,
            primaryVariant: Color(0xFF12121a),
            secondaryVariant: Color(0xFFDBDBF9)));
  }
}
