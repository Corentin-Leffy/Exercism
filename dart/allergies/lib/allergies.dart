class Allergies {
  Map<String, int> allergens = {
    "eggs": 1,
    "peanuts": 2,
    "shellfish": 4,
    "strawberries": 8,
    "tomatoes": 16,
    "chocolate": 32,
    "pollen": 64,
    "cats": 128
  };

  bool allergicTo(String aliment, int score) {}

  List<String> list(int score) {}
}
