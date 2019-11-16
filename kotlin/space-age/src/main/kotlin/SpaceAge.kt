import java.text.DecimalFormat

class SpaceAge(private val seconds: Long) {

    private val decimalFormat = DecimalFormat("#.##")

    fun onEarth(): Double = onEarthDividedBy(1.0)
    fun onMercury(): Double = onEarthDividedBy(0.2408467)
    fun onVenus(): Double = onEarthDividedBy(0.61519726)
    fun onMars(): Double = onEarthDividedBy(1.8808158)
    fun onJupiter(): Double = onEarthDividedBy(11.862615)
    fun onSaturn(): Double = onEarthDividedBy(29.447498)
    fun onUranus(): Double = onEarthDividedBy(84.016846)
    fun onNeptune(): Double = onEarthDividedBy(164.79132)

    private fun onEarthDividedBy(orbitalPeriod: Double): Double =
        decimalFormat.formatToDouble(seconds / SECONDS_ON_EARTH_FOR_YEAR / orbitalPeriod)

    private fun DecimalFormat.formatToDouble(number: Double) = format(number).toDouble()

    companion object {
        const val SECONDS_ON_EARTH_FOR_YEAR = (60 * 60 * 24 * 365.25)
    }
}
