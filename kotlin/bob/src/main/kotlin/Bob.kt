private val String.isAQuestion: Boolean
    inline get() = trimEnd().endsWith("?")

private val String.isShouted: Boolean
    inline get() = this == toUpperCase() && any { it.isLetter() }

object Bob {
    fun hey(sentence: String): String =
        when {
            sentence.isShouted && sentence.isAQuestion -> "Calm down, I know what I'm doing!"
            sentence.isShouted -> "Whoa, chill out!"
            sentence.isAQuestion -> "Sure."
            sentence.isBlank() -> "Fine. Be that way!"
            else -> "Whatever."
        }
}
