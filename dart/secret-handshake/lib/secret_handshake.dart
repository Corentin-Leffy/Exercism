class SecretHandshake {
  Map<String, int> signals = {
    'wink': 1,
    'double blink': 2,
    'close your eyes': 4,
    'jump': 8
  };

  List<String> commands(int input) {
    List<String> handshake =
        signals.keys.where((signal) => input & signals[signal] > 0).toList();

    return input & 16 > 0 ? handshake.reversed.toList() : handshake;
  }
}
