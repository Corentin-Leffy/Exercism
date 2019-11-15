class Gigasecond {
  static const GIGA_SECOND = 1000000000;

  DateTime add(DateTime birthDate) =>
      birthDate.add(Duration(seconds: GIGA_SECOND));
}
