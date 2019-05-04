import UIKit

var inputCases = [
    [],
    [1],
    [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
    [14, 10, 9, 7, 6, 5, 3, 2, 1],
    [1, 2, 3, 5, 6, 7, 9, 10, 14],
    [5, 6, 1, 3, 10, 2, 7, 14, 9],
]
var count = 0
func bubbleSort(input: inout [Int]) {
    if input.isEmpty { return }
    for i in 1..<input.count{
        var isSorted = true
        for j in 0..<input.count-i{
            guard input[j] > input[j+1] else { continue }
                input.swapAt(j, j+1)
                isSorted = false
        }
        if isSorted { break }
    }
}

//bubbleSort(input: &inputCases[0])
//bubbleSort(input: &inputCases[1])
//bubbleSort(input: &inputCases[2])
//bubbleSort(input: &inputCases[3])
//bubbleSort(input: &inputCases[4])
bubbleSort(input: &inputCases[5])
count
inputCases
