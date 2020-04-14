class Luhn {
  bool valid(String input) =>
      input.containsOnlyDigits &&
      input.sanitize.hasAtLeast2Digits &&
      input.sanitize
                  .toReversedIndexedMap()
                  .map(_doubleEvenDigit)
                  .map(_subtractDigitGreaterThen9)
                  .sum() % 10 == 0;

  int _doubleEvenDigit(MapEntry<int, int> entry) =>
      entry.key.isEven ? entry.value : entry.value * 2;

  int _subtractDigitGreaterThen9(int digit) => digit > 9 ? digit - 9 : digit;
}

extension on String {
  bool get containsOnlyDigits => !contains(RegExp(r'[^0-9 ]'));

  String get sanitize => replaceAll(' ', '');

  bool get hasAtLeast2Digits => length > 1;

  List<MapEntry<int, int>> toReversedIndexedMap() =>
      _toDigits().reversed.toIndexedMap();

  List<int> _toDigits() => split('').map((char) => int.parse(char)).toList();
}

extension on Iterable<int> {
  List<MapEntry<int, int>> toIndexedMap() => toList().asMap().entries.toList();

  int sum() => fold(0, (prev, element) => prev + element);
}
