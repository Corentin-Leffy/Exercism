Map<List<String>, int> scrabble = {
  ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]: 1,
  ["D", "G"]: 2,
  ["B", "C", "M", "P"]: 3,
  ["F", "H", "V", "W", "Y"]: 4,
  ["K"]: 5,
  ["J", "X"]: 8,
  ["Q", "Z"]: 10
};

num score(String word) => word
    .toUpperCase()
    .split('')
    .map((letter) => valueForLetter(letter))
    .fold(0, (total, value) => total += value);

num valueForLetter(String letter) =>
    scrabble.entries.firstWhere((entry) => entry.key.contains(letter)).value;
