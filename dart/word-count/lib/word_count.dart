class WordCount {
  static final invalidCharacters = RegExp(r"(?!'\w)([\W']+|['\W])");

  Map<String, int> countWords(String input) => input
      .split(invalidCharacters)
      .where((word) => word.isNotEmpty)
      .map((word) => word.toLowerCase())
      .groupBy((word) => word)
      .map((word, values) => MapEntry(word, values.length));
}

extension GroupBy<S> on Iterable<S> {
  Map<T, List<S>> groupBy<T>(T Function(S) key) {
    final Map<T, List<S>> map = {};
    forEach((element) => (map[key(element)] ??= []).add(element));
    return map;
  }
}
