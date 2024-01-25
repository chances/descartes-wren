/// Authors: Chance Snow
/// Copyright:
/// A port of https://github.com/aeplay/descartes, under the MIT License:
/// Copyright © 2018 Anselm Eickhoff. All rights reserved.
/// Copyright © 2021-2024 Chance Snow
/// License: MIT

class Segment {
  static minLineLength { 0.01 }
  static minArcLength { Segment.minLineLength }
}

class Line {
  /// Returns: Vector
  start { _start }
  /// Returns: Vector
  end { _end }

  /// Params:
  ///   start: Vector
  ///   end: Vector
  construct new(start, end) {
    _start = start
    _end = end
  }

  /// Returns: Vector
  direction { (end - start).normalized }

  /// Returns: Num
  length { (start - end).norm }

  /// Returns: Vector
  midpoint { (start + this.end) / 2 }

  /// Returns: Vector
  startDirection { this.direction }
  /// Returns: Vector
  endDirection { this.direction }

  /// Returns: [Vector]
  subdivisionsWithoutEnd { [start] }
  /// Params: amount: Num
  /// Returns: [Vector]
  subdivisionsWithoutEnd(amount) { [this.start] }

  /// Params: distance: Num
  /// Returns: Vector
  along(distance) { this.start + distance * this.direction }

  /// Params: point: Vector
  /// Returns: Num
  windingAngle(point) { (this.start - point).signedAngleTo(this.end - point) }

  /// Params: point: Vector
  /// Returns: Num
  sideOf(point) { this.windingAngle(point).sign }

  /// Params: point: Vector
  /// Returns: Bool
  isPointLeftOf(point) { this.windingAngle(point) > 0.0 }

  /// Params: point: Vector
  /// Returns: Bool
  isPointRightOf(point) { this.windingAngle(point) < 0.0 }

  /// Params: point: Vector
  /// Returns: Num
  signedDistanceOf(point) {
    var directionOrth = this.direction.orthogonalLeft
    return (point - this.start).dot(directionOrth)
  }
}

class Arc {}
