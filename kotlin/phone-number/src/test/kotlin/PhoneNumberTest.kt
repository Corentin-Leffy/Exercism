import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class PhoneNumberTest {

    @Test
    fun cleansNumber() {
        val expectedNumber = "2234567890"
        val actualNumber = PhoneNumber("(223) 456-7890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun cleansNumberWithDots() {
        val expectedNumber = "2234567890"
        val actualNumber = PhoneNumber("223.456.7890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun cleansNumberWithMultipleSpaces() {
        val expectedNumber = "2234567890"
        val actualNumber = PhoneNumber("223 456   7890   ").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun invalidWhen9Digits() {
        assertNull(PhoneNumber("123456789").number)
    }

    @Test
    fun invalidWhen11DigitsAndFirstIsNot1() {
        assertNull(PhoneNumber("22234567890").number)
    }

    @Test
    fun validWhen11DigitsAndFirstIs1() {
        val expectedNumber = "2234567890"
        val actualNumber = PhoneNumber("12234567890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun validWhen11DigitsAndFirstIs1WithPunctuation() {
        val expectedNumber = "2234567890"
        val actualNumber = PhoneNumber("+1 (223) 456-7890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun invalidWhenMoreThan11Digits() {
        val expectedNumber: String? = null
        val actualNumber = PhoneNumber("321234567890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun invalidWithLetters() {
        val expectedNumber: String? = null
        val actualNumber = PhoneNumber("123-abc-7890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun invalidWithInvalidPunctuation() {
        val expectedNumber: String? = null
        val actualNumber = PhoneNumber("123-@:!-7890").number

        assertEquals(expectedNumber, actualNumber)
    }

    @Test
    fun invalidWhenAreaCodeStartsWith1() {
        assertNull(PhoneNumber("(123) 456-7890").number)
    }

    @Test
    fun invalidWhenAreaCodeStartsWith0() {
        assertNull(PhoneNumber("(023) 456-7890").number)
    }

    @Test
    fun invalidWhenExchangeCodeStartsWith0() {
        assertNull(PhoneNumber("(223) 056-7890").number)
    }

    @Test
    fun invalidWhenExchangeCodeStartsWith1() {
        assertNull(PhoneNumber("(223) 156-7890").number)
    }
}
