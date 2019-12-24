class Diamond {
  final _a = 'A'.codeUnitAt(0);
  int _size;
  int _width;

  List<String> rows(String input) {
    _size = input.codeUnitAt(0) - _a + 1;
    _width = _size * 2 - 1;

    if (_size == 1) return ["A"];

    final diamond = [_diamondTip()];
    for (int index = _size - 2; index >= -(_size - 2); index--) {
      diamond.add(_row(index));
    }
    diamond.add(_diamondTip());

    return diamond;
  }

  String _diamondTip() => "${" " * (_size - 1)}A${" " * (_size - 1)}";

  String _row(int index) {
    final absoluteIndex = index.abs();
    final letter = String.fromCharCode(_a + _size - absoluteIndex - 1);

    return " " * absoluteIndex +
        letter +
        " " * (_width - 2 * (absoluteIndex + 1)) +
        letter +
        " " * absoluteIndex;
  }
}
