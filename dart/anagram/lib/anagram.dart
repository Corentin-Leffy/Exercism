class Anagram {
  List<String> findAnagrams(String subject, List<String> candidates) =>
      candidates
          .where((c) => c.decapitalize().isAnagramOf(subject.decapitalize()))
          .toList();
}

extension AnagramUtils on String {
  String decapitalize() => '${this[0].toLowerCase()}${substring(1)}';

  bool isAnagramOf(String subject) => sort() == subject.sort();

  String sort() => (split("")..sort()).join();
}
