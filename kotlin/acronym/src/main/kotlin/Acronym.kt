object Acronym {
    fun generate(phrase: String): String =
        phrase.split(" ", "-")
            .filter { it.isNotBlank() }
            .map { it[0].toUpperCase() }
            .joinToString("")
}
