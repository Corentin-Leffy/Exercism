object Luhn {

    fun isValid(candidate: String): Boolean =
        candidate
            .replace(Regex("\\s+"), "")
            .takeUnless { it.length <= 1 || it.containsLetter() }
            ?.reversed()
            ?.map(Character::getNumericValue)
            ?.mapIndexed { index, digit -> doubleDigit(index, digit) }
            ?.sum()
            ?.rem(10) == 0

    private fun doubleDigit(index: Int, digit: Int): Int =
        if (index.rem(2) != 0) {
            (digit * 2).takeUnless { it > 9 } ?: digit * 2 - 9
        } else digit

    private fun String.containsLetter(): Boolean = any { it.isLetter() }
}


