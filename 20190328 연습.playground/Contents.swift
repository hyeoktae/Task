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

let test03: (_ num: Int) -> Bool = {($0%2)==0}

test02(21)
test02(20)
test03(20)
test03(21)


func test04(_ num1: Int, _ num2: Int = 10) -> Int {
    return num1*num2
}

let test05:(_ num1: Int, _ num2: Int) -> Int = {$0 * $1}

test04(7)
test04(7,3)
test05(7,2)



let test06:(_ num1: Int, _ num2: Int, _ num3: Int, _ num4: Int) -> Int = {($0+$1+$2+$3)/4}

test06(50,60,70,80)



func test07(_ score: Any) -> Character {
    var scoreInt: Int
    if score is String {
        scoreInt = Int(score as! String) ?? 0
        return test08(scoreInt)
    } else {
        scoreInt = score as! Int
        return test08(scoreInt)
    }
    
}

func test08(_ scoreInt: Int) -> Character{
    switch scoreInt {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    default:
        return "F"
    }
}

test07(99)



func test09(_ score: Any...) -> Character {
    var scoreInt: Int
    var scoreArray: [Int] = []
    var scoreResult: Int = 0
    
    for i in score {
        if i is String {
            scoreInt = Int(i as! String) ?? 0
            scoreArray.append(scoreInt)
        } else {
            scoreInt = i as! Int
            scoreArray.append(scoreInt)
        }
    }
    
    for a in scoreArray {
        scoreResult += a
    }
    scoreResult = scoreResult/scoreArray.count
    
    return test08(scoreResult)
}

test09(90, "75", 70, "80")



func test10(_ num1: Int, _ num2: Int) -> Int {
    
    var result = ""
    
    result = String(num1) + String(num2)
    
    return Int(result) ?? 0
}

let test11: (_ num1: Int, _ num2: Int) -> Int = {Int(String($0) + String($1)) ?? 0}

test10(22,46)
test11(22,45)




func test12() {
    var result:[Int] = []
    for i in 1...100{
        if i%3==0&&i%5==0{
            result.append(i)
        }
    }
    print(result)
}

test12()
