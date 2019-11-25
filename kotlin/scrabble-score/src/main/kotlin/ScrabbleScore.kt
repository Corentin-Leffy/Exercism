object ScrabbleScore {

    private val scrabble = mapOf(
        setOf('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T') to 1,
        setOf('D', 'G') to 2,
        setOf('B', 'C', 'M', 'P') to 3,
        setOf('F', 'H', 'V', 'W', 'Y') to 4,
        setOf('K') to 5,
        setOf('J', 'X') to 8,
        setOf('Q', 'Z') to 10
    ).withDefault { 0 }

    fun scoreWord(word: String): Int =
        word.toUpperCase()
            .sumBy { scoreLetter(it) }

    private fun scoreLetter(letter: Char): Int =
        scrabble.keys
            .find { it.contains(letter) }
            .orEmpty()
            .let { scrabble.getValue(it) }
}
