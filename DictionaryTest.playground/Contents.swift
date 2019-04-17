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


var dic = [1:"소녀시대", 2:"걸스데이", 3:"티아라"]


dic[7] = "애프터스쿨"
print(dic)

for (key, value) in dic.sorted(by: {$0.0 < $1.0}) {
    print("걸그룹 키와 값 -> \(key) : \(value)")
}


var phonebook : [String:[String]] = [:]

var family : [String] = ["엄마", "아빠", "오빠"]
phonebook["가족"] = family

var friends : [String] = ["소녀시대", "걸스데이", "티아라"]
phonebook["친구"] = friends

print("전화번호부의 그룹 개수 : \(phonebook.count)")

for (group, names) in phonebook {
    print("전화번호부 그룹 이름 : \(group)")
    print("\(group) 그룹의 이름들 : \(names)")
}

for (index, element) in phonebook.enumerated() {
    print("index: \(index)")
    print(element)
}

var test = [Int:[String:String]]()

func test1() {
    for i in 0...5 {
        test.updateValue(["a":"b"], forKey: i)
    }
//    print(test.keys.sorted())
}
test1()

for i in 0...5 {
    var inner = test[i]
    inner?.updateValue("c", forKey: "a")
    print(inner)
}
