import 'package:translation_cards/TranslationPair.dart';
import 'package:gsheets/gsheets.dart';
import 'string_extension.dart';

Future<Iterable<TranslationPair>> fetchTranslations() async {
  const _credentials = r'''
{

}

''';

  final gsheets = GSheets(_credentials);
  final ss =
      await gsheets.spreadsheet('1ccokPJn0mReqm6rPEeUr9VF-FKjmeaIlJeJBPB914lg');
  final worksheet = ss.worksheetByIndex(0);
  final rows = worksheet.cells.allRows();

  return rows.then((value) => value.map((row) => row[0].value == "English"
      ? TranslationPair(original: row[2].value.capitalize(), translated: row[3].value)
      : TranslationPair(original: row[3].value.capitalize(), translated: row[2].value)));
}
