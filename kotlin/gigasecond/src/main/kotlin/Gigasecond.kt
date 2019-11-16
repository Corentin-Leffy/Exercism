import java.time.Duration
import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(initialDate: LocalDateTime) {

    constructor(initialDate: LocalDate): this(initialDate.atTime(0, 0, 0))

    val date: LocalDateTime = initialDate + Duration.ofSeconds(1_000_000_000)
}