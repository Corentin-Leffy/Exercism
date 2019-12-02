class Triangle {
  bool equilateral(double a, double b, double c) =>
      a == b && b == c && _hasLengthSuperiorTo0(a, b, c);

  bool isosceles(double a, double b, double c) =>
      (a == b || b == c || a == c) &&
      _respectTriangleEquality(a, b, c) &&
      _hasLengthSuperiorTo0(a, b, c);

  bool scalene(double a, double b, double c) =>
      !equilateral(a, b, c) &&
      !isosceles(a, b, c) &&
      _respectTriangleEquality(a, b, c) &&
      _hasLengthSuperiorTo0(a, b, c);

  bool _respectTriangleEquality(double a, double b, double c) =>
      (a + b >= c) && (a + c >= b) && (b + c >= a);

  bool _hasLengthSuperiorTo0(double a, double b, double c) =>
      (a > 0) && (b > 0) && (c > 0);
}
