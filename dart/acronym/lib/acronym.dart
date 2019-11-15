class Acronym {
  String abbreviate(String input) => input
      .split(RegExp(r'[\s-_]'))
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase())
      .join("");
}
