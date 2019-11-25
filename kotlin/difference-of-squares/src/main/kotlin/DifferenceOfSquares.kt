class Squares(n: Int) {

    private val naturalNumbers = 0..n

    fun sumOfSquares(): Int = naturalNumbers.sumBy { it * it }

    fun squareOfSum(): Int = naturalNumbers.sum().let { it * it }

    fun difference(): Int = squareOfSum() - sumOfSquares()
}
