import Foundation
import Darwin

func figureOutFibonacciNumber(by index: Int) -> Decimal {
    let f = (1 + sqrt(5)) / 2
    
    let number = Decimal(pow(f, Double(index)) / sqrt(5) + 1/2)
    
    return number
}

let value = figureOutFibonacciNumber(by: 100)

print(value)
