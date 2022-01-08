import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../utils/url_launcher.dart';

class CommonDrawer extends ConsumerStatefulWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends ConsumerState<CommonDrawer> {
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
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.025, right: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.018),
              child: Container(
                height: height * 0.08,
                padding: EdgeInsets.only(left: width * 0.05),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
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
                        Text('      Advanced',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                      ],
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        return Checkbox(
                          shape: const CircleBorder(),
                          checkColor: Theme.of(context).colorScheme.secondary,
                          activeColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          value: calculatorMode.isAdvanced,
                          onChanged: (bool? value) async {
                            await _prefs.setInt(
                                'calculator_mode', value! ? 1 : 0);
                            calculatorMode.toggleMode();
                          },
                        );
                      },
                    ),
                  ],
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
                      'Settings',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Container(
                      height: height * 0.08,
                      padding: EdgeInsets.only(left: width * 0.05),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Haptic Feedback',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          Consumer(
                            builder: (context, ref, _) {
                              return Checkbox(
                                shape: const CircleBorder(),
                                checkColor:
                                    Theme.of(context).colorScheme.secondary,
                                activeColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Theme',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
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
                                  child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
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
                                      )),
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
                                        Vibrate.feedback(FeedbackType.success);
                                      }
                                      Navigator.of(context).pop();
                                      themeController
                                          .changeTheme(ThemeMode.light);
                                      await _prefs.setInt('theme_mode', 1);
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
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
                                        )),
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
                                    themeController.changeTheme(ThemeMode.dark);
                                    await _prefs.setInt('theme_mode', 2);
                                  },
                                  child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
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
                                      )),
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
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
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
                            Text('      About',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
