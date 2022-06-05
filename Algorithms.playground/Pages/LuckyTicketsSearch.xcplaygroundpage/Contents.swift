import Foundation

// Low

// 6 values tickets is lucky if sum of first 3 values is equal with last 3 values
// We need to figure out how many lucky tickets there are

func findLuckyTickets() {
    var luckyTicketsCounter = 0
    
    for firstValue in 0..<10 {
        for secondValue in 0..<10 {
            for thirdValue in 0..<10 {
                let sumA = firstValue + secondValue + thirdValue
                
                for fourthValue in 0..<10 {
                    for fifthValue in 0..<10 {
//                        for sixthValue in 0..<10 {
//                            let sumB = fourthValue + fifthValue + sixthValue
//
//                            if sumA == sumB {
//                                luckyTicketsCounter += 1
//                            }
//                        }
//                        optimisation
                        let sixthValue = sumA - fourthValue - fifthValue
                        
                        if sixthValue >= 0 && sixthValue <= 9 {
                            luckyTicketsCounter += 1
                        }
                    }
                }
            }
        }
    }
    
    print("Quantity of all 6-values lucky tickets is \(luckyTicketsCounter)")
}

findLuckyTickets()

// Medium

// 2N-values tickets is lucky if sum of first N values is equal with last N values
// We need to figure out how many 2N-values lucky tickets there are
// N >= 0 && N <= 10

/// Recursive search of lucky tickets
/// - Parameters:
///   - n: quantity of values on the left or right side of ticket (will be multiply on 2)
///   - sumA: the amount of the left side of the ticket
///   - sumB: the amount of the right side of the ticket
func findLuckyTicketsV2(counter: inout Int, n: Int, sumA: Int, sumB: Int) {
    if n == 0 {
        if sumA == sumB {
            counter += 1
        }
        return
    }
    
    for a in 0...9 {
        for b in 0...9 {
            findLuckyTicketsV2(counter: &counter, n: n - 1, sumA: sumA + a, sumB: sumB + b)
        }
    }
}

/// Launch recursive search
/// - Parameter n: quantity of values on the left or right side of ticket (will be multiply on 2)
func startRecursion(n: Int) {
    var counter = 0
    
    findLuckyTicketsV2(counter: &counter, n: n, sumA: 0, sumB: 0)
    
    print("Quantity of all \(n)-values lucky tickets is \(counter)")
}

startRecursion(n: 2)
