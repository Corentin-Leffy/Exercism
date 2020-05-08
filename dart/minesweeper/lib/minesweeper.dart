import 'package:meta/meta.dart';

class Minesweeper {
  final List<_Row> _rows = [];

  List<_Cell> get _cells => _rows.map((row) => row._cells).reduceToList();

  List<String> get annoted => _rows.map((row) => "$row").toList();

  Minesweeper(List<String> rows) {
    _rows.addAll(rows.mapIndexed((row) => _Row(row.key, row.value)));
    countBombs();
  }

  void countBombs() {
    _cells.where((cell) => !cell.isMine).forEach((cell) {
      cell._nearbyMines = _countNearbyMines(of: cell);
    });
  }

  int _countNearbyMines({@required _Cell of}) => _bombNeighborPositions()
      .where((position) => of._position == position)
      .length;

  List<_Position> _bombNeighborPositions() => _cells
      .where((cell) => cell.isMine)
      .map((bomb) => bomb._neighbors)
      .reduceToList();
}

class _Row {
  final List<_Cell> _cells;

  _Row(int index, String row)
      : _cells = row
            .split('')
            .mapIndexed((column) => _Cell(index, column.key, column.value))
            .toList();

  @override
  String toString() => _cells.join();
}

class _Cell {
  final _Position _position;
  final String _character;
  int _nearbyMines = 0;

  _Cell(int x, int y, this._character) : _position = _Position(x, y);

  bool get isMine => _character == "*";

  @override
  String toString() {
    if (isMine || _character.isEmpty) return _character;
    if (_nearbyMines == 0) return " ";
    return "$_nearbyMines";
  }

  List<_Position> get _neighbors => _position.neighbors;
}

class _Position {
  final int x, y;

  _Position(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Position &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  List<_Position> get neighbors => [
        _Position(x - 1, y),
        _Position(x + 1, y),
        _Position(x - 1, y + 1),
        _Position(x + 1, y - 1),
        _Position(x - 1, y - 1),
        _Position(x + 1, y + 1),
        _Position(x, y - 1),
        _Position(x, y + 1),
      ];
}

extension<T> on List<T> {
  Iterable<R> mapIndexed<R>(R f(MapEntry<int, T> e)) =>
      asMap().entries.map<R>(f);
}

extension<A> on Iterable<List<A>> {
  List<A> reduceToList() => fold<List<A>>(
        <A>[],
        (List<A> list, element) => list..addAll(element),
      ).toList();
}
