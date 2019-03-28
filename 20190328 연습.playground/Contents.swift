import UIKit

func test01(_ name: String, _ age: Int) {
    print("이름은: \(name), 나이는: \(age)")
}
test01("tass", 29)



func test02(_ number: Int) -> Bool {
    guard (number % 2) == 0 else {
        return false
    }
    return true
}
test02(21)
test02(20)



