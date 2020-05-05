import 'package:benchmark_harness/benchmark_harness.dart';

class ScrabbleWithMap extends BenchmarkBase {
  const ScrabbleWithMap() : super('Scrabble with Map benchmark');

  static const _scrabble = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']: 1,
    ['D', 'G']: 2,
    ['B', 'C', 'M', 'P']: 3,
    ['F', 'H', 'V', 'W', 'Y']: 4,
    ['K']: 5,
    ['J', 'X']: 8,
    ['Q', 'Z']: 10
  };

  num score(String word) => word
      .toUpperCase()
      .split('')
      .map(valueForLetter)
      .fold(0, (total, value) => total += value);

  num valueForLetter(String letter) =>
      _scrabble.entries.firstWhere((entry) => entry.key.contains(letter)).value;

  static void main() {
    ScrabbleWithMap().report();
  }

  @override
  void run() {
    score('abcdefghijklmnopqrstuvwxyz');
  }
}

class ScrabbleWithMapAndDefaultValue extends BenchmarkBase {
  const ScrabbleWithMapAndDefaultValue()
      : super('Scrabble with Map and default value benchmark');

  static const _scrabble2 = {
    ['D', 'G']: 2,
    ['B', 'C', 'M', 'P']: 3,
    ['F', 'H', 'V', 'W', 'Y']: 4,
    ['K']: 5,
    ['J', 'X']: 8,
    ['Q', 'Z']: 10
  };

  num score2(String word) => word
      .toUpperCase()
      .split('')
      .map(valueForLetter2)
      .fold(0, (total, value) => total + value);

  num valueForLetter2(String letter) => _scrabble2.entries
      .firstWhere(
        (entry) => entry.key.contains(letter),
        orElse: () => MapEntry([], 1),
      )
      .value;

  static void main() {
    ScrabbleWithMapAndDefaultValue().report();
  }

  @override
  void run() {
    score2('abcdefghijklmnopqrstuvwxyz');
  }
}

class ScrabbleWithRunes extends BenchmarkBase {
  const ScrabbleWithRunes() : super('Scrabble with Runes');

  static const _scrabble = {
    [65, 69, 73, 79, 85, 76, 78, 82, 83, 84]: 1,
    [68, 71]: 2,
    [66, 67, 77, 80]: 3,
    [70, 72, 86, 87, 89]: 4,
    [75]: 5,
    [74, 88]: 8,
    [81, 90]: 10
  };

  num score(String word) => word
      .toUpperCase()
      .runes
      .map(valueForLetter)
      .fold(0, (total, value) => total + value);

  num valueForLetter(int letter) =>
      _scrabble.entries.firstWhere((entry) => entry.key.contains(letter)).value;

  static void main() {
    ScrabbleWithRunes().report();
  }

  @override
  void run() {
    score('abcdefghijklmnopqrstuvwxyz');
  }
}

class ScrabbleWithRunesAndDefaultValue extends BenchmarkBase {
  const ScrabbleWithRunesAndDefaultValue()
      : super('Scrabble with Runes and default value');

  static const _scrabble = {
    [68, 71]: 2,
    [66, 67, 77, 80]: 3,
    [70, 72, 86, 87, 89]: 4,
    [75]: 5,
    [74, 88]: 8,
    [81, 90]: 10
  };

  num score(String word) => word
      .toUpperCase()
      .runes
      .map(valueForLetter)
      .fold(0, (total, value) => total + value);

  num valueForLetter(int letter) => _scrabble.entries
      .firstWhere(
        (entry) => entry.key.contains(letter),
        orElse: () => MapEntry([], 1),
      )
      .value;

  static void main() {
    ScrabbleWithRunesAndDefaultValue().report();
  }

  @override
  void run() {
    score('abcdefghijklmnopqrstuvwxyz');
  }
}
