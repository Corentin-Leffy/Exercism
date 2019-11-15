class Dna(private val dna: String) {

    private val regex = Regex("[ACGT]*")

    init {
        require(dna.matches(regex)) { "Only A, C, G and T allowed in DNA string." }
    }

    val nucleotideCounts: Map<Char, Int>
        get() = mapOf(
            'A' to dna.count { it == 'A' },
            'C' to dna.count { it == 'C' },
            'G' to dna.count { it == 'G' },
            'T' to dna.count { it == 'T' }
        )
}
