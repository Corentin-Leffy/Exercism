object PigLatin {

    private val vowels = arrayOf("yt", "xr", "a", "e", "i", "o", "u")
    private val consonants = arrayOf("ch", "qu", "squ", "thr", "th", "rh", "sch")

    fun translate(input: String): String =
        input
            .split(" ")
            .joinToString(" ") { word ->
                val output = word.takeIf { it.startsWithVowels }
                    ?: word.movePrefixToEnd(word.firstConsonantsCluster)
                output + "ay"
            }

    private inline val String.startsWithVowels: Boolean
        get() = vowels.any { startsWith(it) }

    private inline val String.firstConsonantsCluster: String
        get() = consonants.firstOrNull { startsWith(it) } ?: get(0).toString()

    private fun String.movePrefixToEnd(prefix: String): String = removePrefix(prefix) + prefix
}