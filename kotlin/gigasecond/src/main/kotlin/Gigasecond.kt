import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(initialDate: LocalDateTime) {

    constructor(initialDate: LocalDate): this(initialDate.atStartOfDay())

    val date: LocalDateTime = initialDate.plusSeconds(1_000_000_000)
}