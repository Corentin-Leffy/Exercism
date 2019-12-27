class Darts {
  static const int OUTER_CIRCLE_RADIUS = 10;
  static const int MIDDLE_CIRCLE_RADIUS = 5;
  static const int INNER_CIRCLE_RADIUS = 1;

  static const int OUTER_CIRCLE_SCORE = 1;
  static const int MIDDLE_CIRCLE_SCORE = 5;
  static const int INNER_CIRCLE_SCORE = 10;

  static final scores = {
    INNER_CIRCLE_RADIUS: INNER_CIRCLE_SCORE,
    MIDDLE_CIRCLE_RADIUS: MIDDLE_CIRCLE_SCORE,
    OUTER_CIRCLE_RADIUS: OUTER_CIRCLE_SCORE,
  };

  static final defaultValue = () => MapEntry<int, int>(0, 0);

  int score(num x, num y) => scores.entries
      .firstWhere((entry) => isInCircle(x, y, entry.key), orElse: defaultValue)
      .value;

  bool isInCircle(num x, num y, int radius) =>
      x * x + y * y - radius * radius <= 0;
}
