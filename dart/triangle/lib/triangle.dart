class Triangle {
  bool equilateral(double a, double b, double c) =>
      a == b && b == c && a != 0;

  bool isosceles(double a, double b, double c) =>
      (a == b || b == c || a == c) &&
          _respectTriangleEquality(a, b, c);

  bool scalene(double a, double b, double c) =>
      !isosceles(a, b, c) && _respectTriangleEquality(a, b, c);

  bool _respectTriangleEquality(double a, double b, double c) =>
      (a + b >= c) && (a + c >= b) && (b + c >= a);
}