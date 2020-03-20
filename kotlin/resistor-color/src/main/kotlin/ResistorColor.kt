object ResistorColor {

    fun colorCode(input: String): Int = colors().indexOf(input)

    fun colors(): List<String> = arrayListOf(
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white"
    )

}
