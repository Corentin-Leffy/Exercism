class Allergies {
  static const allergens = const {
    "eggs": 1,
    "peanuts": 2,
    "shellfish": 4,
    "strawberries": 8,
    "tomatoes": 16,
    "chocolate": 32,
    "pollen": 64,
    "cats": 128
  };

  bool allergicTo(String aliment, int score) => score & allergens[aliment] != 0;

  List<String> list(int score) =>
      allergens.keys.where((aliment) => allergicTo(aliment, score)).toList();
}
