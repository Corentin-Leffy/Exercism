class Hamming {
  int distance(String original, String replicate) {
    noStrandMustBeEmpty(original, replicate);
    mustBeOfEqualLength(original, replicate);

    return original
        .mapIndexed()
        .where((entry) => entry.value != replicate[entry.key])
        .length;
  }

  void noStrandMustBeEmpty(String original, String replicate) {
    if ((original.isEmpty && replicate.isNotEmpty) ||
        (original.isNotEmpty && replicate.isEmpty)) {
      throw ArgumentError('no strand must be empty');
    }
  }

  void mustBeOfEqualLength(String original, String replicate) {
    if (original.length != replicate.length) {
      throw ArgumentError('left and right strands must be of equal length');
    }
  }
}

extension on String {
  Iterable<MapEntry<int, String>> mapIndexed() =>
      split("")
          .asMap()
          .entries;
}
