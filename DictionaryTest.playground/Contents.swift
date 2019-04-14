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
