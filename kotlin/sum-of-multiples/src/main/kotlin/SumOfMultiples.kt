object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int =
        (1 until limit).sumBy { it getFactorFrom factors }

    private infix fun Int.getFactorFrom(factors: Set<Int>): Int =
        takeIf { factors containsAtLeastOneFactorFor it } ?: 0

    private infix fun Set<Int>.containsAtLeastOneFactorFor(n: Int): Boolean =
        filter { it != 0 }.any { n % it == 0 }
}
