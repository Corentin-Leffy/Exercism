class PhoneNumber {
  RegExp invalidCharacters = RegExp(r'[\s-_().+]');
  RegExp letters = RegExp(r'[a-zA-Z]');
  RegExp punctuations = RegExp(r'[@:!]');

  String clean(String phoneNumber) {
    var sanitizePhoneNumber = phoneNumber.replaceAll(invalidCharacters, '');

    requireAtLeast10Digits(sanitizePhoneNumber);
    requireSpecialFormatWhen11Digits(sanitizePhoneNumber);
    requireLessThen11Digits(sanitizePhoneNumber);
    requireOnlyNumbers(sanitizePhoneNumber);
    requireNoPunctuations(sanitizePhoneNumber);
    requireAreaCodeStartingAt2(sanitizePhoneNumber);
    requireExchangeCodeStartingAt2(sanitizePhoneNumber);

    return sanitizePhoneNumber.replaceFirst("1", "");
  }

  void requireAtLeast10Digits(String phoneNumber) {
    if (phoneNumber.length < 10)
      throw FormatException("incorrect number of digits");
  }

  void requireSpecialFormatWhen11Digits(String phoneNumber) {
    if (phoneNumber.length == 11 && !phoneNumber.startsWith("1"))
      throw FormatException("11 digits must start with 1");
  }

  void requireLessThen11Digits(String phoneNumber) {
    if (phoneNumber.length > 11) throw FormatException("more than 11 digits");
  }

  void requireOnlyNumbers(String phoneNumber) {
    if (phoneNumber.contains(letters))
      throw FormatException("letters not permitted");
  }

  void requireNoPunctuations(String phoneNumber) {
    if (phoneNumber.contains(punctuations))
      throw FormatException("punctuations not permitted");
  }

  void requireAreaCodeStartingAt2(String phoneNumber) {
    var paddingAreaCode = phoneNumber.length == 11 ? 1 : 0;
    var firstAreaCode = phoneNumber[0 + paddingAreaCode];

    if (firstAreaCode.startsWith("0"))
      throw FormatException("area code cannot start with zero");

    if (firstAreaCode.startsWith("1"))
      throw FormatException("area code cannot start with one");
  }

  void requireExchangeCodeStartingAt2(String phoneNumber) {
    var paddingAreaCode = phoneNumber.length == 11 ? 1 : 0;
    var secondAreaCode = phoneNumber[3 + paddingAreaCode];

    if (secondAreaCode.startsWith("0"))
      throw FormatException("exchange code cannot start with zero");

    if (secondAreaCode.startsWith("1"))
      throw FormatException("exchange code cannot start with one");
  }
}
