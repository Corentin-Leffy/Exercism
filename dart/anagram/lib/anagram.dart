class Anagram {
  List<String> findAnagrams(String subject, List<String> candidates) =>
      candidates
          .map((word) => MapEntry(word, word.toLowerCase()))
          .where((word) => word.value != subject.toLowerCase())
          .where((word) => word.value.isAnagramOf(subject.toLowerCase()))
          .map((word) => word.key)
          .toList();
}

extension AnagramUtils on String {
  bool isAnagramOf(String subject) => sort() == subject.sort();

  String sort() => (split("")..sort()).join();
}
