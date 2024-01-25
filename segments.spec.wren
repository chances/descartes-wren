import "./wren_modules/wren-assert/Assert" for Assert

import "./segments" for Line
import "./vector" for Vector

var a = Vector.new(0,0)
var b = Vector.new(10,0)
var ab = Line.new(a, b)
Assert.equal(ab.length, 10)
