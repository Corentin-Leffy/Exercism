class Squares(n: Int) {

    private val naturalNumbers = 1..n

    fun sumOfSquares(): Int = naturalNumbers.sumBy { it.square() }

    fun squareOfSum(): Int = naturalNumbers.sum().square()

    fun difference(): Int = squareOfSum() - sumOfSquares()

    private fun Int.square(): Int = this * this
}
