class Robot(
    var gridPosition: GridPosition = GridPosition(0, 0),
    var orientation: Orientation = Orientation.NORTH
) {

    fun advance() {
        val (x, y) = orientation.advancePosition()
        val (previousX, previousY) = gridPosition
        gridPosition = GridPosition(x + previousX, y + previousY)
    }

    fun turnLeft() {
        orientation = orientation.left()
    }

    fun turnRight() {
        orientation = orientation.right()
    }

    fun simulate(instructions: String) {
        instructions.forEach { char ->
            when (char) {
                'R' -> turnRight()
                'L' -> turnLeft()
                'A' -> advance()
            }
        }
    }
}
