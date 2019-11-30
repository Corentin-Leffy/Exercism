enum class Orientation {

    NORTH {
        override fun left(): Orientation = WEST
        override fun right(): Orientation = EAST
        override fun advancePosition(): Pair<Int, Int> = 0 to 1
    },
    EAST {
        override fun left(): Orientation = NORTH
        override fun right(): Orientation = SOUTH
        override fun advancePosition(): Pair<Int, Int> = 1 to 0
    },
    SOUTH {
        override fun left(): Orientation = EAST
        override fun right(): Orientation = WEST
        override fun advancePosition(): Pair<Int, Int> = 0 to - 1
    },
    WEST {
        override fun left(): Orientation = SOUTH
        override fun right(): Orientation = NORTH
        override fun advancePosition(): Pair<Int, Int> = - 1 to 0
    };

    abstract fun left(): Orientation
    abstract fun right(): Orientation
    abstract fun advancePosition(): Pair<Int, Int>
}
