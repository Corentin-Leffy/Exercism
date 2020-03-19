import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) => _from1To(n).sum().square();

  num sumOfSquare(int n) => _from1To(n).mapToSquares().sum();

  num differenceOfSquares(int n) => squareOfSum(n) - sumOfSquare(n);

  List<num> _from1To(int n) => List.generate(n, (i) => i + 1);
}

extension on Iterable<num> {
  num sum() => reduce(_sum);

  num _sum(num previous, num next) => previous + next;

  Iterable<num> mapToSquares() => map((n) => n.square());
}

extension on num {
  num square() => pow(this, 2);
}
