import kotlin.math.pow

object ArmstrongNumber {

    fun check(number: Int): Boolean =
            number == number
                    .toDigits()
                    .map { it `^` number.size }
                    .sum()

    private fun Int.toDigits(): Iterable<Int> =
            toString().map(Character::getNumericValue)

    private inline val Int.size: Int
        get() = toString().length

    private infix fun Int.`^`(exponent: Int) = toDouble().pow(exponent).toInt()
}
