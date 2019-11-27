object RomanNumerals {

    private val romanNumeralValues = mapOf(
        1 to "I",
        4 to "IV",
        5 to "V",
        9 to "IX",
        10 to "X",
        40 to "XL",
        50 to "L",
        90 to "XC",
        100 to "C",
        400 to "CD",
        500 to "D",
        900 to "CM",
        1000 to "M"
    )

    fun value(n: Int): String =
        romanNumeralValues
            .entries
            .findLast { n - it.key >= 0 }
            ?.let { it.value + value(n - it.key) } ?: ""
}