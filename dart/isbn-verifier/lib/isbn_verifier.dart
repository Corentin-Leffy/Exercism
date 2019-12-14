RegExp isValidCharacter = RegExp(r"[0-9\-X]");

bool isValid(String isbn) =>
    _format(isbn).length == 10 && _value(_format(isbn)) % 11 == 0;

String _format(String isbn) => isbn
    .split('')
    .where((s) => isValidCharacter.hasMatch(s))
    .join()
    .replaceAll('-', '');

int _value(String isbn) => isbn.entries.fold<int>(
    0,
    (result, current) => result +=
        _valueFor(current.value, current.key) * (isbn.length - current.key));

int _valueFor(String character, int position) =>
    character == 'X' && position == 9 ? 10 : int.tryParse(character) ?? 0;

extension StringHelper on String {
  Iterable<MapEntry<int, String>> get entries => split('').asMap().entries;
}
