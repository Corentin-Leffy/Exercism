class Bob {
  String response(String input) {
    if (input.isBlank) return "Fine. Be that way!";
    if (input.isAQuestionShouted) return "Calm down, I know what I'm doing!";
    if (input.isAQuestion) return "Sure.";
    if (input.isShouted) return "Whoa, chill out!";
    return "Whatever.";
  }
}

extension SentenceUtils on String {
  bool get isAQuestionShouted => isShouted && isAQuestion;

  bool get isAQuestion => trim().endsWith("?");

  bool get isBlank => trim().isEmpty;

  bool get isShouted => this == toUpperCase() && this != toLowerCase();
}
