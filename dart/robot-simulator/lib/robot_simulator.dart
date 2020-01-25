import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';
import 'package:robot_simulator/unknown_orientation_exception.dart';

class Robot {
  Position position;
  Orientation orientation;

  Robot(this.position, this.orientation);

  static const clockwiseOrientations = {
    Orientation.north: Orientation.east,
    Orientation.east: Orientation.south,
    Orientation.south: Orientation.west,
    Orientation.west: Orientation.north,
  };

  static const counterClockwiseOrientations = {
    Orientation.north: Orientation.west,
    Orientation.west: Orientation.south,
    Orientation.south: Orientation.east,
    Orientation.east: Orientation.north,
  };

  void move(String instruction) {
    instruction.split("").forEach((letter) {
      if (letter == "R") rotateClockwise();
      if (letter == "L") rotateCounterClockwise();
      if (letter == "A") advance();
    });
  }

  void rotateClockwise() => orientation = clockwiseOrientations[orientation];

  void rotateCounterClockwise() =>
      orientation = counterClockwiseOrientations[orientation];

  void advance() {
    switch (orientation) {
      case Orientation.north:
        position.y++;
        break;
      case Orientation.west:
        position.x--;
        break;
      case Orientation.south:
        position.y--;
        break;
      case Orientation.east:
        position.x++;
        break;
      default:
        throw UnknownOrientation(orientation);
    }
  }
}
