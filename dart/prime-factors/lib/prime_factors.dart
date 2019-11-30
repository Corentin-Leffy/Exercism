class PrimeFactors {
  List<int> factors(int input) {
    var factors = <int>[];

    for (int factor = 2; input >= factor; factor++)
      for (; input % factor == 0; input ~/= factor) factors.add(factor);

    return factors;
  }
}
