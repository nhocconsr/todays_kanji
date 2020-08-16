import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:todays_kanji/app_state.dart';
import 'package:todays_kanji/view/preferences_view.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: Consumer<AppState>(
        builder: (context, state, child) => PreferencesView(state.preferences),
      ),
    );
  }
}
