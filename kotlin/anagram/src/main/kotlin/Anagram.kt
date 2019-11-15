class Anagram(subject: String) {

    private val subject: String = subject.decapitalize()

    fun match(candidates: List<String>): Set<String> =
        candidates
            .filter { candidate -> subject isAnagramOf candidate }
            .toSet()

    private infix fun String.isAnagramOf(candidate: String): Boolean =
        groupBy { it } == candidate.decapitalize().groupBy { it }
}

