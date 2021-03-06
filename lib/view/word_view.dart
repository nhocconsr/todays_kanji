import 'package:flutter/material.dart';
import 'package:todays_kanji/model/word_form_model.dart';
import 'package:todays_kanji/model/word_model.dart';
import 'package:todays_kanji/model/word_sense_model.dart';
import 'package:todays_kanji/screens/word.dart';
import 'package:todays_kanji/util/general.dart';
import 'package:todays_kanji/view/word_form_view.dart';
import 'package:todays_kanji/view/word_sense_view.dart';
import 'package:todays_kanji/widgets/annotation.dart';
import 'package:todays_kanji/widgets/annotations/jlpt_annotation.dart';

class WordView extends StatelessWidget {
  final WordModel model;
  final bool partition;
  WordView(this.model, {this.partition = true});

  @override
  Widget build(BuildContext context) {
    List<Widget> senses = [];
    List<WordSenseModel> senseData = model.senses;
    for (int i = 0; i < senseData.length; i++) {
      senses.add(WordSenseView(senseData[i], i));
    }

    List<Widget> forms = [];
    List<WordFormModel> formData = model.forms.sublist(1);
    if (0 < formData.length) {
      forms.add(Text("Also:"));
    }
    for (WordFormModel form in formData) {
      forms.add(WordFormView(form));
    }

    final WordFormModel mainForm = model.forms[0];

    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: WordFormView(mainForm, heading: true),
                ),
              ),
              Row(
                children: [
                  model.common ? Annotation("common") : Container(),
                  model.jlpt > 0 ? JLPTAnnotation(model.jlpt) : Container(),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          partition && senses.length > 0 ? Divider(height: 8) : Container(),
          Builder(builder: (context) {
            if (senses.length == 0) return Container();
            return Padding(
              padding: EdgeInsets.all(8),
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: senses,
              ),
            );
          }),
          partition && forms.length > 0 ? Divider(height: 8) : Container(),
          Builder(builder: (context) {
            if (forms.length == 0) return Container();
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: forms,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          })
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          WordScreen.ROUTENAME,
          arguments: WordScreenArguments(
            word: mainForm.word,
            pronunciation: katakanaToHiragana(mainForm.reading),
          ),
          // arguments: "${mainForm.word} ${katakanaToHiragana(mainForm.reading)}",
        );
      },
    );
  }
}
