class RnaTranscription {
  final dnaToRna = {"G": "C", "C": "G", "T": "A", "A": "U"};

  String toRna(String dna) =>
      dna.split("").map((nucleotide) => dnaToRna[nucleotide]).join("");
}
