object Pangram {

    private val alphabet: Set<Char> = ('a'..'z').toSet()

    fun isPangram(string: String): Boolean =
        string.toLowerCase()
            .toSet()
            .containsAll(alphabet)
}
