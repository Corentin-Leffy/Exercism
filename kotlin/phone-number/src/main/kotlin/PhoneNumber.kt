class PhoneNumber(phoneNumber: String) {

    private val unauthorizedCharacters = Regex("[\\s-_().+]")
    private val letters = Regex("[a-zA-Z]")
    private val punctuations = Regex("[@:!]")

    val number: String? =
        phoneNumber
            .replace(unauthorizedCharacters, "")
            .takeUnless { it.hasLessThenMiniDigits or (it.hasMaxDigitsAndStartWith1 or it.hasMoreThenMaxDigits) }
            ?.takeUnless { it.contains(letters) or it.contains(punctuations) }
            ?.takeUnless { it.hasInvalidAreaCode }
            ?.takeUnless { it.hasInvalidExchangeCode }
            ?.removePrefix("1")

    private inline val String.hasLessThenMiniDigits: Boolean
        get() = length <= MINI_DIGITS

    private inline val String.hasMaxDigitsAndStartWith1: Boolean
        get() = (length == MAX_DIGITS) and (first() != '1')

    private inline val String.hasMoreThenMaxDigits: Boolean
        get() = length > MAX_DIGITS

    private inline val String.hasInvalidAreaCode: Boolean
        get() = get(paddingIndex).is0or1

    private inline val String.hasInvalidExchangeCode: Boolean
        get() = get(INDEX_EXCHANGE_CODE + paddingIndex).is0or1

    private inline val String.paddingIndex: Int
        get() = if (length == MAX_DIGITS) 1 else 0

    private inline val Char.is0or1: Boolean
        get() = (this == '0') or (this == '1')

    companion object {
        const val MINI_DIGITS = 9
        const val MAX_DIGITS = 11
        const val INDEX_EXCHANGE_CODE = 3
    }
}


