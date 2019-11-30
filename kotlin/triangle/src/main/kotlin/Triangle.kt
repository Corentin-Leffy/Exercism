class Triangle<out T: Number>(
    private val a: T,
    private val b: T,
    private val c: T
) {

    init {
        require(a != 0) { "a is equal to 0 !" }
        require(b != 0) { "b is equal to 0 !" }
        require(c != 0) { "c is equal to 0 !" }
        require((b + c) >= a) { "$a is greater then sum of $b and $c !" }
        require((a + c) >= b) { "$b is greater then sum of $a and $c !" }
        require((a + b) >= c) { "$c is greater then sum of $a and $b !" }
    }

    val isEquilateral: Boolean = a == b && b == c
    val isIsosceles: Boolean = a == b || b == c || a == c
    val isScalene: Boolean = ! isEquilateral && ! isIsosceles

    private operator fun Number.plus(other: Number): Number =
        when (this) {
            is Long -> toLong() + other.toLong()
            is Int -> toInt() + other.toInt()
            is Double -> toDouble() + other.toDouble()
            is Float -> toFloat() + other.toFloat()
            else -> throw RuntimeException("Unknown numeric type")
        }

    private operator fun Number.compareTo(other: Number): Int =
        when (this) {
            is Long -> toLong().compareTo(other.toLong())
            is Int -> toInt().compareTo(other.toInt())
            is Double -> toDouble().compareTo(other.toDouble())
            is Float -> toFloat().compareTo(other.toFloat())
            else -> throw RuntimeException("Unknown numeric type")
        }
}
