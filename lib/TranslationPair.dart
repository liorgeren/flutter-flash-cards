class TranslationPair {
  TranslationPair({this.original, this.translated});

  final String original;
  final String translated;

  String toString() => "(original=$original, translated=$translated)";
}