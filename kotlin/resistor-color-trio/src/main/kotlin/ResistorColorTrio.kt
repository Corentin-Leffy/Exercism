import kotlin.math.pow

object ResistorColorTrio {

    fun text(vararg input: Color): String {
        val (mainValue, units) = mainValueAndUnits(input.resistorValue())
        return "$mainValue $units"
    }

    private fun mainValueAndUnits(resistorValue: Int) =
            Unit.values()
                    .reversed()
                    .map { resistorValue / 10.pow(it.ordinal * 3) to it.name.toLowerCase() }
                    .first { it.first > 1 }

    private fun Array<out Color>.resistorValue() =
            (first().ordinal * 10 + get(1).ordinal) * 10.pow(last().ordinal)

    private fun Int.pow(ordinal: Int) = toDouble().pow(ordinal).toInt()
}
