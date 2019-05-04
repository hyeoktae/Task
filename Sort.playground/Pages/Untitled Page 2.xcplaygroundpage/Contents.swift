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

func selectionSort(input: inout [Int]) {
    for i in input.indices {
        var minIdx = i
        for j in (i+1)..<input.count {
            guard input[minIdx] > input[j] else {
                continue
            }
            minIdx = j
        }
        input.swapAt(i, minIdx)
    }
}


selectionSort(input: &inputCases[0])
inputCases[0]


























//: [Next](@next)
