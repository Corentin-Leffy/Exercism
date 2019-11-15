import java.time.Duration
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.temporal.Temporal

class Gigasecond(date: Temporal) {

    private val initialDate: LocalDateTime =
        date as? LocalDateTime
            ?: (date as? LocalDate)?.atTime(0, 0, 0)
            ?: throw IllegalArgumentException("$date can't be transform to LocalDateTime !")

    val date: LocalDateTime
        get() = initialDate + Duration.ofSeconds(1_000_000_000)
}