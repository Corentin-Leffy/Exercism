object Raindrops {
    fun convert(input: Int): String = buildString {
        if (input hasFactor 3) append("Pling")
        if (input hasFactor 5) append("Plang")
        if (input hasFactor 7) append("Plong")
        if (isEmpty()) input.toString()
    }

    private infix fun Int.hasFactor(factor: Int): Boolean = this % factor == 0
}
