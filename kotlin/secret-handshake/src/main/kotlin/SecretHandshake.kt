object HandshakeCalculator {

    private val signals = Signal.values()

    fun calculateHandshake(number: Int): List<Signal> {
        val binary = number.toString(2)
        return binary
            .reversed()
            .take(signals.size)
            .mapIndexedNotNull { index, char -> getSignalOrNull(index, char) }
            .reverseIfHas10000(binary)
    }

    private fun getSignalOrNull(index: Int, char: Char): Signal? =
        signals[index].takeIf { char == '1' }

    private fun List<Signal>.reverseIfHas10000(binary: String): List<Signal> =
        takeUnless { binary.length >= 5 && binary.first() == '1' } ?: reversed()
}



