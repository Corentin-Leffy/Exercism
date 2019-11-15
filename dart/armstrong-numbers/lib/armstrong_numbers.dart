import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    String numberAsString = number.toString();
    return number == numberAsString
          .split('')
          .map((n) => pow(int.parse(n), numberAsString.length))
          .reduce((sum, n) => sum += n);
  }
}
