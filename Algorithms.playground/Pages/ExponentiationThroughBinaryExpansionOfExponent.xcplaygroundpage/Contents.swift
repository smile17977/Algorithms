// O(2LogN) = O(LogN)

/// exponentiate a value in degree
/// - Parameters:
///   - value:  value which exponentiate in degree
///   - degree: degree of value
/// - Returns: calculation result
func exponentiate(value: Double, degree: Int) -> Double {
    var n = degree
    var d = value
    var p: Double = 1
    
    // We divide n (degree) on 2 in each iteration while n > 1
    while n > 1 {
        n /= 2
        
        // Then multiply value by itself
        d *= d
        
        // After that if n (degree) is not divide by 2 then p (resultValue) multiply by itself
        if n % 2 == 1 {
            p *= d
        }
    }
    
    return p
}

let value = exponentiate(value: 1.001, degree: 1000)

print(value)
