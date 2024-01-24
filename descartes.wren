/// Authors: Chance Snow
/// Copyright: Copyright © 2021 Chance Snow. All rights reserved.
/// License: MIT License
/// See: https://github.com/chances/descartes-d

// TODO: Add general constants and functions

/// Section: Angles
/// Angle-related linear algebra.

/// Params:
///   a: V2
///   b: V2
/// Returns: Num
var angleTo = Fn.new {|a, b|
  var theta = dot(a, b) / (a.norm * b.norm)
  return theta.min(1.0).max(-1.0).acos
}

/// Params:
///   a: V2
///   aDirection: V2
///   b: V2
/// Returns: Num
var angleAlongTo = Fn.new {|a, aDirection, b|
  var simpleAngle = angleTo(a, b)
  var linearDirection = normalize(b - a)

  if (aDirection.dot(linearDirection) >= 0) return simpleAngle
  return 2.0 * Num.pi - simpleAngle
}

/// Params:
///   a: V2
///   b: V2
/// Returns: Num
var signedAngleTo = Fn.new {|a, b|
  // See https://stackoverflow.com/a/2150475
  var det = a.x * b.y - a.y * b.x
  var dot = a.x * b.x + a.y * b.y
  return det.atan(dot)
}

// TODO: Move these to the V2 class
/// Params:
///   self: V2
/// Returns: V2
///
/// Warning:
/// Descarte assumes a right-hand coordinate system.
///
/// Positive angles are counter-clockwise if z-axis points offscreen.
var orthogonalRight = Fn.new {|self|
  return V2(self.y, -self.x)
}

/// Params:
///   self: V2
/// Returns: V2
///
/// Warning:
/// Descarte assumes a right-hand coordinate system.
///
/// Positive angles are counter-clockwise if z-axis points offscreen.
var orthogonalLeft = Fn.new {|self|
  return orthogonalRight(self.inverse)
}
