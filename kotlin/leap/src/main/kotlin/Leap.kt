data class Year(val year: Int) {

    val isLeap: Boolean =
        ((year isDivisibleBy 4) and (year isNotDivisibleBy 100)) or (year isDivisibleBy 400)

    private infix fun Int.isDivisibleBy(number: Int): Boolean =
        this % number == 0

    private infix fun Int.isNotDivisibleBy(number: Int): Boolean =
        ! isDivisibleBy(number)
}
