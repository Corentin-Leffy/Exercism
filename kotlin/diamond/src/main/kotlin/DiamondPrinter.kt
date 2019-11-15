class DiamondPrinter {

    fun printToList(letter: Char): List<String> {
        val bottomDiamond = (letter downTo 'A')
            .mapIndexed { index, char -> createLine(char, numberOfOuterSpaces = index) }
        return bottomDiamond.toMutableList()
            .drop(1)
            .reversed()
            .toMutableList()
            .also { it.addAll(bottomDiamond) }
    }

    private fun createLine(
        char: Char,
        numberOfOuterSpaces: Int,
        outerSpaces: String = " ".repeat(numberOfOuterSpaces),
        numberOfInnerSpaces: Int = getNumberOfInnerSpaces(char),
        innerSpaces: String = " ".repeat(numberOfInnerSpaces)
    ) =
        "$char".surroundWith(outerSpaces)
            .takeIf { char == 'A' }
            ?: innerSpaces
                .surroundWith("$char")
                .surroundWith(outerSpaces)

    private fun getNumberOfInnerSpaces(char: Char) =
        ((('A' until char).count() * 2) - 1).takeUnless { it < 0 } ?: 0
}

internal fun String.surroundWith(delimiter: String): String = "$delimiter$this$delimiter"
