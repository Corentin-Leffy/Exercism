class WordCount {
  static final invalidCharacters = RegExp(r"(?!'\w)([\W']+|['\W])");

  Map<String, int> countWords(String input) {
    String sentence = input.toLowerCase().replaceAll(invalidCharacters, " ");
    return sentence
        .split(" ")
        .where((word) => word.isNotEmpty)
        .fold({}, (map, word) => _sum(map, {word: _count(word, sentence)}));
  }

  int _count(String word, String input) =>
      RegExp("\\b($word)\\b").allMatches(input).length;

  Map<String, int> _sum(Map<String, int> map, Map<String, int> word) {
    map.addAll(word);
    return map;
  }
}
