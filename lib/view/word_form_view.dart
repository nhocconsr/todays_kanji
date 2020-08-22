import 'package:flutter/material.dart';
import 'package:todays_kanji/model/word_form_model.dart';
import 'package:todays_kanji/util/general.dart';
import 'package:todays_kanji/widgets/japanese_text.dart';

class WordFormView extends StatelessWidget {
  final bool heading;
  final WordFormModel model;
  final bool readingAsRomaji;
  WordFormView(
    this.model, {
    this.heading = false,
    this.readingAsRomaji = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var readingStyle = TextStyle(
      //TODO somehow add this to theme
      color: theme.textTheme.bodyText2.color.withOpacity(0.8),
    );
    Widget reading;
    if (readingAsRomaji) {
      reading = Text(
        "  \"${kanaToRomaji(model.reading)}\"",
        style: readingStyle,
      );
    } else {
      reading = JapaneseText("「${model.reading}」", style: readingStyle);
    }

    List<Widget> content = [];
    if (model.word != null) {
      content.add(JapaneseText(
        model.word,
        style: this.heading ? theme.textTheme.headline6 : null,
      ));
      if (model.reading != null) {
        content.add(reading);
      }
    } else if (model.reading != null) {
      content.add(reading);
    }

    return Wrap(
      children: content,
      crossAxisAlignment: WrapCrossAlignment.center,
    );
  }
}
