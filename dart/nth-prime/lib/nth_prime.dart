import 'dart:math';

class NthPrime {
  int prime(int nth) {
    requireNthSuperiorTo0(nth);
    return primeSieveOfEratosthenes(nth);
  }

  void requireNthSuperiorTo0(int nth) {
    if (nth == 0) throw ArgumentError('There is no zeroth prime');
  }

  int primeSieveOfEratosthenes(int nth) {
    final primes = [2];
    for (var i = 3; primes.length < nth; i += 2) {
      if (isPrime(primes, i)) primes.add(i);
    }
    return primes.last;
  }

  bool isPrime(List<int> primes, int i) => primes
      .take(higherDivisorLimit(i))
      .every((number) => i.isMultipleOf(number));

  int higherDivisorLimit(int i) => sqrt(i).toInt();
}

extension on int {
  bool isMultipleOf(int n) => this % n != 0;
}
