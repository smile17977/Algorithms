import Darwin

/// exponentiate a value in degree
/// - Parameters:
///   - value:  value which exponentiate in degree
///   - degree: degree of value
/// - Returns: calculation result
func exponentiate(value: Double, degree: Int) -> Double {
    var newValue: Double = 1
    
    /// Calculation the nearest degree of two
    let nearestDegree = getNearestDegreeOfTwo(for: degree)
    
    /// If nearestDegree > 1 then exponentiate the value to it and exponentiate the value to remainDegree else just exponentiate a value in degree
    if nearestDegree > 1 {
        newValue = value
        
        /// Multiply the value by itself
        for _ in 0..<nearestDegree {
            newValue *= newValue
        }
        
        /// Exponentiate a value to the nearestDegree
        let pow = pow(2.0, Double(nearestDegree))
        
        /// Exponentiate a value to the remainDegree
        if pow != Double(degree) {
            let diff = degree - Int(pow)
            
            if diff > 0 {
                for _ in 0..<diff {
                    newValue *= value
                }
            }
        }
    } else {
        for _ in 0..<degree {
            newValue *= value
        }
    }
    
    return newValue
}

/// Figure out the nearest degree of 2
/// - Parameter degree: for this value we try to find the nearest degree of 2
/// - Returns: Int value
func getNearestDegreeOfTwo(for degree: Int) -> Int {
    var nearestDegree = 0
    
    var multiplier = 1
    
    while multiplier <= degree {
        if (multiplier * 2) <= degree {
            nearestDegree += 1
            multiplier *= 2
        } else {
            break
        }
        
    }
    
    return nearestDegree
}


let value = exponentiate(value: 2, degree: 100)

print(value)
