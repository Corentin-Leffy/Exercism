enum class Classification { DEFICIENT, PERFECT, ABUNDANT }

fun classify(naturalNumber: Int): Classification {
    require(naturalNumber >= 1) { "$naturalNumber must be a natural number !" }

    return (1..naturalNumber / 2)
        .sumBy { it.takeIf { naturalNumber.rem(it) == 0 } ?: 0 }
        .let { getClassification(it, naturalNumber) }
}

private fun getClassification(aliquotSum: Int, naturalNumber: Int): Classification =
    when {
        aliquotSum > naturalNumber -> Classification.ABUNDANT
        aliquotSum < naturalNumber -> Classification.DEFICIENT
        else -> Classification.PERFECT
    }

