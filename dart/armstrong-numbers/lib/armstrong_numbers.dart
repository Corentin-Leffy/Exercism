import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) => _armstrong(number) == number;

  num _armstrong(int number) => '$number'
      .split('')
      .map(int.parse)
      .map((n) => pow(n, '$number'.length))
      .reduce((sum, n) => sum + n);
}
