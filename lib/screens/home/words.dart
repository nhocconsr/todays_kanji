import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_kanji/app_state.dart';
import 'package:todays_kanji/widgets/dynamic_lists/word_list.dart';
import 'package:todays_kanji/widgets/loading_indicator.dart';

class WordsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WordsTabState();
}

class _WordsTabState extends State<WordsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<AppState>(builder: (context, state, child) {
      if (state.loadingKanji) return LoadingIndicator();
      return WordList(query: "*${state.preferences.kanjiSymbol}*");
    });
  }

  @override
  bool get wantKeepAlive => true;
}
