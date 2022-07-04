
/// exponentiate a value in degree
/// - Parameters:
///   - value:  value which exponentiate in degree
///   - degree: degree of value
/// - Returns: calculation result
func exponentiate(value: Double, degree: Int) -> Double {
    var newValue: Double = 1
    
    for _ in 0..<degree {
        newValue *= value
    }
    
    return newValue
}

let newValue = exponentiate(value: 2, degree: 100)

print(newValue)
