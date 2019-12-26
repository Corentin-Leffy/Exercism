import 'dart:collection';

class MatchingBrackets {
  bool isPaired(String input) {
    final queue = Queue<String>();
    var isValid = true;

    input.forEach((index, character) {
      isValid = !_isInvalid(character, queue);
      _addOnlyOpeningBracket(character, queue);
    });

    return isValid && queue.isEmpty;
  }

  bool _isInvalid(String character, Queue<String> queue) =>
      character.isClosingBracket &&
      (queue.isEmpty || character.isLatestClosingBracket(queue.removeLast()));

  void _addOnlyOpeningBracket(String character, Queue queue) {
    if (character.isOpeningBracket) {
      queue.add(character);
    }
  }
}

extension on String {
  static final _brackets = {"[": "]", "{": "}", "(": ")"};

  static final _openingBrackets = _brackets.keys;
  static final _closingBrackets = _brackets.values;

  bool get isClosingBracket => _closingBrackets.contains(this);

  bool get isOpeningBracket => _openingBrackets.contains(this);

  bool isLatestClosingBracket(String lastBracket) =>
      this != _brackets[lastBracket];

  void forEach(void fun(int index, String character)) {
    split('').asMap().forEach(fun);
  }
}
