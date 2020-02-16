class Luhn {
  bool valid(String input) =>
      _containsOnlyDigits(input) &&
      _hasAtLeast2Digits(input) &&
      _reverseToIndexedMap(_sanitize(input))
                  .map((entry) => _doubleSecondDigit(entry))
                  .map((value) => _substractDigitGreaterThen9(value))
                  .sum() % 10 == 0;

  bool _hasAtLeast2Digits(String input) => _sanitize(input).length > 1;

  String _sanitize(String input) => input.replaceAll(' ', '');

  bool _containsOnlyDigits(String input) => !input.contains(RegExp(r'[^0-9 ]'));

  List<MapEntry<int, int>> _reverseToIndexedMap(String input) =>
      input.toInts().reversed.toIndexedMap();

  int _doubleSecondDigit(MapEntry<int, int> entry) =>
      entry.key % 2 == 0 ? entry.value : entry.value * 2;

  int _substractDigitGreaterThen9(int value) => value > 9 ? value - 9 : value;
}

extension on String {
  List<int> toInts() => split('').map((char) => int.parse(char)).toList();
}

extension on Iterable<int> {
  List<MapEntry<int, int>> toIndexedMap() => toList().asMap().entries.toList();

  int sum() => fold<int>(0, (prev, element) => prev + element);
}
