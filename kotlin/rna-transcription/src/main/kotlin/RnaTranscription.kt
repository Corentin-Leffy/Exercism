fun transcribeToRna(dna: String): String =
    dna.map { it.toRna() }
        .joinToString("")

internal fun Char.toRna(): Char =
    when (this) {
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        else -> throw IllegalArgumentException("Unknown nucleotide : $this")
    }
