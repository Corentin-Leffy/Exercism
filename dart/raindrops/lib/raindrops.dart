class Raindrops {
  String convert(int input) {
    var raindrops = "";
    if (input % 3 == 0) raindrops += "Pling";
    if (input % 5 == 0) raindrops += "Plang";
    if (input % 7 == 0) raindrops += "Plong";
    if (raindrops.isEmpty) raindrops = "$input";
    return raindrops;
  }
}
