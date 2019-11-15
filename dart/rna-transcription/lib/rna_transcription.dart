class RnaTranscription {
  String toRna(String dna) =>
      dna.split("").map((nucleotide) => transcribe(nucleotide)).join("");

  String transcribe(String nucleotide) {
    switch (nucleotide) {
      case "G":
        return "C";
      case "C":
        return "G";
      case "T":
        return "A";
      case "A":
        return "U";
      default:
        throw ArgumentError("Unknown nucleotide : $nucleotide");
    }
  }
}
