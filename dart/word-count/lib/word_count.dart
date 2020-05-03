class WordCount {
  static final invalidCharacters = RegExp(r"(?!'\w)([\W']+|['\W])");

  Map<String, int> countWords(String input) => input
      .split(invalidCharacters)
      .where((word) => word.isNotEmpty)
      .map((word) => word.toLowerCase())
      .fold(<String, int>{},
          (map, word) => map..update(word, _inc, ifAbsent: _default));

  int _default() => 1;

  int _inc(int i) => ++i;
}
