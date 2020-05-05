const _scrabble = {
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
