import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/history.dart';

class BottomSheet extends ConsumerStatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomSheetState();
}

class _BottomSheetState extends ConsumerState<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shadowDarkColor: Theme.of(context).colorScheme.onBackground,
                    shadowLightColor: Theme.of(context).colorScheme.onSurface,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )),
              Text(AppLocalizations.of(context)!.history,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary)),
              NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shadowDarkColor: Theme.of(context).colorScheme.onBackground,
                    shadowLightColor: Theme.of(context).colorScheme.onSurface,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  onPressed: () async {
                    await HistoryDatabase.instance
                        .deleteHistory()
                        .then((value) => setState(() {}));
                  },
                  child: Center(
                    child: Icon(
                      Icons.delete_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Neumorphic(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            style: NeumorphicStyle(
              depth: -5,
              color: Theme.of(context).scaffoldBackgroundColor,
              shadowDarkColorEmboss: Theme.of(context).colorScheme.onBackground,
              shadowLightColorEmboss: Theme.of(context).colorScheme.onSurface,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            ),
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: HistoryDatabase.instance.getHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //if history is empty
                    final history = snapshot.data as List<Map<String, dynamic>>;
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.historyEmpty,
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                      );
                    }
                    return ListView.separated(
                      itemCount: history.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(color: Theme.of(context).colorScheme.primary),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final historyIndex = history[index];
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SelectableText(
                                    historyIndex['resultExpr'].toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SelectableText(
                                    '= ${historyIndex['result']}',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  }
                }),
          ),
        ),
      ],
    );
  }
}
