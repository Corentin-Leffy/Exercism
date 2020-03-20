object ResistorColorDuo {

    fun value(vararg colors: Color): Int =
            colors.take(2)
                    .joinToString("") { it.value }
                    .toInt()

    private val Color.value: String
        get() = ordinal.toString()
}
