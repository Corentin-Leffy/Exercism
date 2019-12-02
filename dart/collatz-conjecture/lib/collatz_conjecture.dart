class CollatzConjecture {
  int steps(int input) {
    if (input <= 0) throw ArgumentError('Only positive numbers are allowed');

    var step = 0;
    for (step; input != 1; step++)
      input.isEven ? input ~/= 2 : input = input * 3 + 1;

    return step;
  }
}
