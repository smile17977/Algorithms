import Foundation

protocol MultiplyableProtocol {
    static func *(lhs: Self, rhs: Self) -> Self
}

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

extension Matrix: MultiplyableProtocol {
    static func * (lhs: Matrix, rhs: Matrix) -> Matrix {
        guard lhs.columns == 2 && lhs.rows == 2 && rhs.columns == 2 && rhs.columns == 2
        else {
            fatalError()
        }
        
        var matrix = Matrix(rows: 2, columns: 2)
        
        matrix[0, 0] = lhs[0, 0] * rhs[0, 0] + lhs[0, 1] * rhs[1, 0]
        print("[0, 0]: \(lhs[0, 0]) * \(rhs[0, 0]) + \(lhs[0, 1]) * \(rhs[1, 0]) = \(matrix[0, 0])")
        
        matrix[0, 1] = lhs[0, 0] * rhs[0, 1] + lhs[0, 1] * rhs[1, 1]
        print("[0, 1]: \(lhs[0, 0]) * \(rhs[0, 1]) + \(lhs[0, 1]) * \(rhs[1, 1]) = \(matrix[0, 1])")
        
        matrix[1, 0] = lhs[1, 0] * rhs[0, 0] + lhs[1, 1] * rhs[1, 0]
        print("[1, 0]: \(lhs[1, 0]) * \(rhs[0, 0]) + \(lhs[1, 1]) * \(rhs[1, 0]) = \(matrix[1, 0])")
        
        matrix[1, 1] = lhs[1, 0] * rhs[0, 1] + lhs[1, 1] * rhs[1, 1]
        print("[1, 1]: \(lhs[1, 0]) * \(rhs[0, 1]) + \(lhs[1, 1]) * \(rhs[1, 1]) = \(matrix[1, 1])")
        
        return matrix
    }
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

/// Figure out fibonacci number by index using matrix multiply
/// - Parameter index: index of fibonacci number
/// - Returns: fibonacci number
func getFibonacciNumber(index: Int) -> Decimal {
    // default matrix
    var matrix = Matrix(rows: 2, columns: 2)
    
    matrix[0, 0] = 1
    matrix[0, 1] = 1
    matrix[1, 0] = 1
    matrix[1, 1] = 0
    
    // for fibonacci numbers 0, 1, 2
    if index <= 2 {
        switch index {
        case 0:  return Decimal(matrix[1, 1])
        case 1:  return Decimal(matrix[1, 0])
        default:  return Decimal(matrix[0, 1])
        }
    }
    
    /// Calculation the nearest degree of two
    let nearestDegree = getNearestDegreeOfTwo(for: index)
    
    var finishMatrix = matrix
    
    /// If nearestDegree > = 2 then exponentiate the matrix to it and exponentiate the matrix to remainDegree else just exponentiate a value in degree
    if nearestDegree >= 2 {
        /// Multiply the matrix by itself
        for _ in 0..<nearestDegree {
            finishMatrix = finishMatrix * finishMatrix
        }
        
        /// Exponentiate a value to the nearestDegree
        let pow = pow(2.0, Double(nearestDegree))
        
        /// Exponentiate a value to the remainDegree
        if pow != Double(index) {
            let diff = index - Int(pow)
        
            if diff > 0 {
                for _ in 0..<diff {
                    finishMatrix = finishMatrix * matrix
                }
            }
        }
    }
    
    print(finishMatrix)
    
    return Decimal(finishMatrix[0, 1])
}

let fiboNumber = getFibonacciNumber(index: 100)
