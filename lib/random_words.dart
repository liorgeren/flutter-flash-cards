import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translation_cards/ExpandableListTile.dart';
import 'package:translation_cards/fetch_translations.dart';

import 'TranslationPair.dart';


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  Future<Iterable<TranslationPair>> futureTranslations;
  final _bigFont = TextStyle(fontSize: 15.0);

  @override
  void initState() {
    super.initState();
    futureTranslations = fetchTranslations();
  }

  Widget _buildSuggestions() {
    return FutureBuilder<Iterable<TranslationPair>>(
      future: futureTranslations,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          List<TranslationPair> translations = snapshot.data.toList();

          return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, i) {
                return ExpandableListTile(title: translations[i].original, subtitle: translations[i].translated);
          }
          );
        }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translation Cards')),
      body: _buildSuggestions(),
    );
  }
}
