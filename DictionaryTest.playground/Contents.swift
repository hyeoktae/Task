import UIKit

var testArray = ["1", "2", "3"]

var testDict = [String:[String]]()

testDict.updateValue(["5"], forKey: "1")

testDict["1"]?.append(contentsOf: testArray)

print([String](testDict["1"] ?? []))

for i in 0...5 {
//    print(i)
//    print(testDict.count )
    testDict.updateValue([], forKey: "\(i)")
}
print(testDict.count)

for i in testDict.keys {
    print(i)
}


enum Car: Int {
    case benz = 0
    case bmw
    case other
}

enum CarSize: String {
    case small = "small"
    case medium = "medium"
    case big = "big"
}

var car = Car(rawValue: 1)
var car1 = Car(rawValue: 0)
var size1 = CarSize(rawValue: "small")

print(car)
//print(car1!)
//print(car1!.rawValue)
//print(size1!)
//print(size1!.rawValue)
