class BeerSong {
  List<String> recite(int startBottles, int bottles) {
    List<String> song = List.generate(bottles, (i) => startBottles - 1 * i)
        .map((numberOfBottle) => getSentenceFor(numberOfBottle) + [''])
        .fold([], (song, sentence) => song + sentence)
          ..removeLast();
    return song;
  }

  List<String> getSentenceFor(int bottles) {
    switch (bottles) {
      case 0:
        return [
          "No more bottles of beer on the wall, no more bottles of beer.",
          "Go to the store and buy some more, 99 bottles of beer on the wall."
        ];
        break;
      case 1:
        return [
          "1 bottle of beer on the wall, 1 bottle of beer.",
          "Take it down and pass it around, no more bottles of beer on the wall."
        ];
        break;
      case 2:
        return [
          "2 bottles of beer on the wall, 2 bottles of beer.",
          "Take one down and pass it around, 1 bottle of beer on the wall."
        ];
        break;
      default:
        return [
          "$bottles bottles of beer on the wall, $bottles bottles of beer.",
          "Take one down and pass it around, ${bottles - 1} bottles of beer on the wall."
        ];
        break;
    }
  }
}
