class Isogram {
  RegExp _alpha = new RegExp(r'^[a-zA-Z]+$');

  bool isIsogram(String input) {
    String isogram = input.toLowerCase();
    return isogram
        .split('')
        .where((c) => isAlpha(c))
        .every((c) => isogram.lastIndexOf(c) == isogram.indexOf(c));
  }

  bool isAlpha(String string) => _alpha.hasMatch(string);
}
