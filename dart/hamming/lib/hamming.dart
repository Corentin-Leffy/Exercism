class Hamming {
  int distance(String original, String replicate) {
    noStrandMustBeEmpty(original, replicate);
    mustBeOfEqualLength(original, replicate);

    var distance = 0;

    for (var index = 0; index < original.length; index++) {
      distance += original[index] != replicate[index] ? 1 : 0;
    }

    return distance;
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
