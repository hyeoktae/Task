//: [Previous](@previous)

import Foundation

var inputCases = [
    [],
    [1],
    [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
    [14, 10, 9, 7, 6, 5, 3, 2, 1],
    [1, 2, 3, 5, 6, 7, 9, 10, 14],
    [5, 6, 1, 3, 10, 2, 7, 14, 9],
]

func insertionSection(input: inout [Int]) {
    guard !input.isEmpty else {
        return
    }
    for idx in 1..<input.count {
        let currentValue = input[idx]
        var insertionIdx = idx
        
        for comparisonIdx in (0..<idx).reversed() {
            guard currentValue < input[comparisonIdx] else { break }
            input[comparisonIdx + 1] = input[comparisonIdx]
            insertionIdx = comparisonIdx
            
        }
        input[insertionIdx] = currentValue
    }
}

for i in inputCases.indices {
    insertionSection(input: &inputCases[i])
    print(inputCases[i])
}












//: [Next](@next)
