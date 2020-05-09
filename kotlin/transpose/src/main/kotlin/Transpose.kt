object Transpose {

    fun transpose(input: List<String>): List<String> {
        val matrix = mutableListOf<String>()
        input.forEachIndexed { indexRow, row ->
            row.forEachIndexed { indexChar, char ->
                matrix.addOrReplace(indexChar, "${matrix.stringToPad(indexChar).pad(indexRow)}$char")
            }
        }
        return matrix
    }

    private fun MutableList<String>.stringToPad(index: Int): String =
            if (indices.contains(index)) this[index] else ""

    private fun MutableList<String>.addOrReplace(indexChar: Int, element: String) {
        if (indices.contains(indexChar)) {
            this[indexChar] = element
        } else {
            add(indexChar, element)
        }
    }

    private fun String.pad(length: Int) = padEnd(length, ' ')
}
