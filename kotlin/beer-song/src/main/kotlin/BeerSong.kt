import BeerSong.Sentence.None
import BeerSong.Sentence.Plural
import BeerSong.Sentence.Single
import BeerSong.Sentence.Two

object BeerSong {

    sealed class Sentence() {
        class Plural(private val bottles: Int): Sentence() {
            override fun toString(): String = """
                   $bottles bottles of beer on the wall, $bottles bottles of beer.
                   Take one down and pass it around, ${bottles - 1} bottles of beer on the wall.
                   
                """.trimIndent()
        }

        object Two: Sentence() {
            override fun toString(): String = """
                      2 bottles of beer on the wall, 2 bottles of beer.
                      Take one down and pass it around, 1 bottle of beer on the wall.
                      
                """.trimIndent()
        }

        object Single: Sentence() {
            override fun toString(): String = """
                    1 bottle of beer on the wall, 1 bottle of beer.
                    Take it down and pass it around, no more bottles of beer on the wall.
                    
                """.trimIndent()
        }

        object None: Sentence() {
            override fun toString(): String = """
                 No more bottles of beer on the wall, no more bottles of beer.
                 Go to the store and buy some more, 99 bottles of beer on the wall.
                 
            """.trimIndent()
        }
    }

    private fun getSentence(bottles: Int): String =
        when (bottles) {
            0 -> None
            1 -> Single
            2 -> Two
            else -> Plural(bottles)
        }.toString()

    fun verses(startBottles: Int, endBottles: Int): String =
        (startBottles downTo endBottles).joinToString("\n") { getSentence(it) }
}
