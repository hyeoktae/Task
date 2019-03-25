import UIKit




//아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool
    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }
    return isAscending
}


var test2 = { (s1: String, s2: String) in return
    s1 > s2 ? true : false
}
test2("aaa", "ddd")

let test5: (String, String) -> Bool = {$0 > $1}
test5("ddd", "eee")

let someClosure1: (String, String)->Bool={$0 > $1}
someClosure1("ssd","dfe")



let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}


let otherClosure2: ([Int]) -> Int = {$0.count}
otherClosure2([9,2,2,3,4,4])




// 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수



func combineString(str1: String?, str2: String?, str3: String?) -> String {
    
    var result: String = ""
    
    result += str1 == nil ? "" : str1!
    result += str2 == nil ? "" : str2!
    result += str3 == nil ? "" : str3!
    
    return result
}


let combineString2: (String?, String?, String?) -> String = {
    var result: String = ""
    
    let  arr = [$0, $1, $2]
    type(of: arr)
    for i in arr {
        result += i ?? ""
    }
    return result
}

combineString2("A", nil, "B")

combineString(str1: "ab", str2: nil, str3: "cd")



// 입력 예시 및 결과
// combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
// combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"


//let str = "AB"
//let str2 = ""
//
//UnicodeScalar(str)?.value
//print("")




let reverse: (Int) -> Int = {
    var h = 0
    var num1 = $0
    while num1 > 0 {
        h *= 10
        h += num1 % 10
        num1 = num1 / 10
    }
    return h
}
reverse(123)
reverse(343535)
