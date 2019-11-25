class Series(private val input: String) {

    init {
        require(input.all { it.isDigit() })
    }

    fun getLargestProduct(span: Int): Long {
        require(span <= input.length)

        return input
            .takeIf { it.isNotEmpty() and (span != 0) }
            ?.map { Character.getNumericValue(it).toLong() }
            ?.windowed(span) { it.reduce { acc, i -> acc * i } }
            ?.max() ?: 1L
    }
}
