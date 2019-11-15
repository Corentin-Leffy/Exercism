object Series {

    fun slices(n: Int, input: String): List<List<Int>> {
        require(input.length >= n) { "The length of input '$input' must be smaller then the input length $n !" }
        require(n > 0) { "Slice length $n can't be 0 or negative !" }
        require(input.isNotBlank()) { "The input can't be empty or blank !" }

        return input.map { it.toString().toInt() }.windowed(n)
    }
}
