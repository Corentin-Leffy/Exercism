class PascalsTriangle {
  List<List<int>> rows(int numberOfRows) {
    final triangle = <List<int>>[];

    for (int nthRow = 1; nthRow <= numberOfRows; nthRow++) {
      triangle.add(row(nthRow, previousRow(triangle, nthRow)));
    }

    return triangle;
  }

  List<int> row(int nthRow, List<int> previousRow) {
    final newRow = createNewRowFrom(previousRow);

    for (int index = 0; index < previousRow.length - 1; index++) {
      newRow.add(sumOf(previousRow, at: index));
    }

    return newRow..add(1);
  }

  List<int> previousRow(List<List<int>> rows, int nthRow) =>
      rows.isNotEmpty ? rows[nthRow - 2] : [];

  List<int> createNewRowFrom(List<int> previousRow) =>
      previousRow.isNotEmpty ? [1] : [];

  int sumOf(List<int> previousRow, {int at}) =>
      previousRow[at] + previousRow[at + 1];
}
