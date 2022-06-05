import Foundation

/// Draw function
/// - Parameters:
///   - x: horizontal bound
///   - y: vertical bound
///   - compareClosure: condition for compare
func drawSomething(x: Int, y: Int, _ compareClosure: @escaping (_ xValue: Double, _ yValue: Double) -> Bool) {
    for xValue in 0..<x {
        for yValue in 0..<y {
            print(compareClosure(Double(xValue), Double(yValue)) ? "# " : ". ", terminator: "")
        }
        print("\n")
    }
}

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue < yValue
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue == yValue
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue == 24 - yValue
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue < 30 - yValue
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    round(xValue / 2) == yValue
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue < 10 || yValue < 10
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue > 15 && yValue > 15
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    abs(xValue - yValue) > 10
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    round(xValue / (yValue + 1)) == 1
}

print("\n")
print("d")
drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue == 1 || yValue == 23 || xValue == 23 || yValue == 1
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue * xValue + yValue * yValue <= 400
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue + yValue >= 20 && xValue + yValue <= 28
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    xValue * yValue <= 400
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    abs(xValue - 12) + abs(yValue - 12) <= 10
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    sin(xValue / 3) <= yValue / 8 - 2
}

print("\n")

drawSomething(x: 25, y: 25) { xValue, yValue in
    Int(xValue) % 6 == 0 || Int(yValue) % 6 == 0
}
