class ResistorColorDuo {
  List<String> get colors => const [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white"
      ];

  int colorCode(String color) => colors.indexOf(color);

  int value(List<String> colors) =>
      int.parse(colors.map((color) => colorCode(color)).join());
}
