import "package:flutter/material.dart";
import 'package:todays_kanji/kanji_icons.dart';
import 'package:todays_kanji/screens/home/todayskanji.dart';
import 'package:todays_kanji/screens/home/words.dart';
import 'package:todays_kanji/widgets/screen.dart';
import 'package:todays_kanji/widgets/search_buttons/word_search_button.dart';
import 'package:todays_kanji/widgets/settings_button.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTENAME = "/home";

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(icon: Icon(KanjiIcons.character), text: "Character"),
      Tab(icon: Icon(KanjiIcons.words), text: "Browse Words")
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Screen(
        appBar: AppBar(
          title: Text("Today's Kanji"),
          centerTitle: true,
          actions: [WordSearchButton(), SettingsButton()],
          bottom: TabBar(tabs: tabs),
        ),
        child: TabBarView(
          children: [TodaysKanjiTab(), WordsTab()],
        ),
      ),
    );
  }
}
