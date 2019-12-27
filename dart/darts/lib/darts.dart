import 'dart:math';

class Darts {
  static final Circle OuterCircle = Circle(10, 1);
  static final Circle MiddleCircle = Circle(5, 5);
  static final Circle InnerCircle = Circle(1, 10);

  static final scores = {InnerCircle, MiddleCircle, OuterCircle};

  static final defaultValue = () => Circle(0, 0);

  int score(num x, num y) => scores
      .firstWhere((circle) => circle.contains(x, y), orElse: defaultValue)
      .score;
}

class Circle {
  int _radius;
  int score;

  static final center = Point(0, 0);

  Circle(int radius, int score) {
    this._radius = radius;
    this.score = score;

  }

  bool contains(num x, num y) => Point(x, y).distanceTo(center) <= _radius;
}
