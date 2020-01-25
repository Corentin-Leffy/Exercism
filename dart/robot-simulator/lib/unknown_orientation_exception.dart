import 'package:robot_simulator/orientation.dart';

class UnknownOrientation implements Exception {
  final Orientation orientation;

  const UnknownOrientation(this.orientation);

  @override
  String toString() => "Unknown orientation: $orientation";
}
