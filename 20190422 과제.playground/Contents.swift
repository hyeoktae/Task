import UIKit

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]

print(array.map{ $0 })

print(array.map{$0.compactMap{$0}})

print(array
    .flatMap { $0 }
    .map {$0})

print(array
    .flatMap { $0 }
    .compactMap { $0 })

