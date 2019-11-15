import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) => pow(List.generate(n, (i) => i + 1).reduce(_sum), 2);

  num sumOfSquare(int n) =>
      List.generate(n, (i) => pow(i + 1, 2).toInt()).reduce(_sum);

  num differenceOfSquares(int n) => squareOfSum(n) - sumOfSquare(n);

  int _sum(int left, int right) => left + right;
}
