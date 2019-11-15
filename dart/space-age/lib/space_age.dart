class SpaceAge {
  double age({String planet, int seconds}) => Planet.from(planet).age(seconds);
}

extension DoubleUtil on double {
  double fixed(int fractionDigits) =>
      double.parse(toStringAsFixed(fractionDigits));
}

abstract class Planet {
  static const _secondsOnEarthForAYear = (60 * 60 * 24 * 365.25);

  double orbitalPeriod;

  double age(int seconds) =>
      (seconds / _secondsOnEarthForAYear / orbitalPeriod).fixed(2);

  static Planet from(String planet) {
    switch (planet) {
      case "Mercury":
        return Mercury();
      case "Venus":
        return Venus();
      case "Mars":
        return Mars();
      case "Jupiter":
        return Jupiter();
      case "Uranus":
        return Uranus();
      case "Saturn":
        return Saturn();
      case "Neptune":
        return Neptune();
      default:
        return Earth();
    }
  }
}

class Neptune extends Planet {
  @override
  double orbitalPeriod = 164.79132;
}

class Saturn extends Planet {
  @override
  double orbitalPeriod = 29.447498;
}

class Uranus extends Planet {
  @override
  double orbitalPeriod = 84.016846;
}

class Jupiter extends Planet {
  @override
  double orbitalPeriod = 11.862615;
}

class Mars extends Planet {
  @override
  double orbitalPeriod = 1.8808158;
}

class Venus extends Planet {
  @override
  double orbitalPeriod = 0.61519726;
}

class Earth extends Planet {
  @override
  double orbitalPeriod = 1;
}

class Mercury extends Planet {
  @override
  double orbitalPeriod = 0.2408467;
}
