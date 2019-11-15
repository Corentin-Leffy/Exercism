object Hamming {
    fun compute(original: String, replicate: String): Int {
        require(original.length == replicate.length) { "left and right strands must be of equal length." }

        return original.zip(replicate).count { it.first != it.second }
    }
}