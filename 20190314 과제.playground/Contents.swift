import UIKit



//    - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201


print("1번 문제")
func revers(_ number: Int) -> Int{
    
    let toString = String(number)
    var preResult = ""
    var toArray: Array<Character> = []
    
    for i in 0 ..< toString.count {
        toArray.append(toString[toString.index(toString.startIndex, offsetBy: i)])
    }
    
    for i in (0 ..< toArray.count).reversed() {
        preResult += String(toArray[i])
    }

    return Int(preResult)! 
}

print(revers(1235663899))


//    - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]


print("2번 문제")

var testArr = ["a", "b", "c", "a", "e", "d", "c", "c", "c", "f", "a", "c", "g", "a", "z", "g", "e"]

let pickUp: ([String]) -> [String] = {
    var basicArr = $0.sorted()
    var resultArr: [String] = []
    
    for i in 0 ..< basicArr.count-2{
        for j in i+1 ..< basicArr.count-1 {
            (basicArr[j-1] != basicArr[j]) && (basicArr[j] != basicArr[j+1]) ?
                resultArr.append(basicArr[j]) : ()
            break
        }
    }
    
    (basicArr[basicArr.count-1] != basicArr[basicArr.count-2]) ?
        resultArr.append(basicArr[basicArr.count-1]):()
    
    return Set(resultArr).sorted()
}

pickUp(testArr)


func pickUp2(array: [String]) -> [String] {
    var basicArr = array.sorted()
    var resultArr: [String] = []
    
    for i in 0 ..< basicArr.count-2{
        for j in i+1 ..< basicArr.count-1 {
            if (basicArr[j-1] != basicArr[j]) && (basicArr[j] != basicArr[j+1]) {
                resultArr.append(basicArr[j]);  break
            }
        }
    }
    
    (basicArr[basicArr.count-1] != basicArr[basicArr.count-2]) ?
        resultArr.append(basicArr[basicArr.count-1]):()
    
    return Set(resultArr).sorted()
}

pickUp2(array: testArr)


//- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]


print("3번 문제")
let replace: () -> Array<Int> = {
    let orignal = [2, 8, 7, 1, 4, 3,6,3,8,0,2,4,78,33]
    var result: Array<Int> = []
    
    for i in orignal {
        if i % 2 != 0 {
            result.insert(i, at: 0)
        }else {
            result.append(i)
        }
    }
    
    
    return result
}

print(replace())


//- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
//enum Arithmetic {
//    case addition, subtraction, multiplication, division
//}
//func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
//     코드
//}
print("4번 문제")

enum Arithmetic {
    case addition, subtraction, multiplication, division
}
let calculator:(_ operand1: Int,_ operand2: Int, _ op: Arithmetic) -> Int =  {
    
    switch $2 {
    case .addition:
        return $0 + $1
    case .subtraction:
        return $0 - $1
    case .multiplication:
        return $0 * $1
    case .division:
        return $0 / $1
    }
}

calculator(3, 5, .addition)

//print (calculator(operand1: 5, operand2: 5, op: .addition))
//calculator(operand1: 5, operand2: 5, op: .division)
//calculator(operand1: 5, operand2: 5, op: .multiplication)
//calculator(operand1: 5, operand2: 5, op: .subtraction)

//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


var 식육목 =
    ["식육목": [
        "개과": [
            "개": ["자칼", "늑대", "북미산 이리"],
            "여우": ["아메리카 여우", "유럽 여우"],
        ],
        "고양이과": [
            "고양이": ["고양이", "살쾡이"],
            "표범": ["사자", "호랑이"]
        ]
        ]
]

print(식육목["식육목"]!["고양이과"]!["표범"]!)

if let 식육목 = 식육목["식육목"], let 고양이과 = 식육목["고양이과"], let 표범 = 고양이과["표범"] {
    print(표범)
}


// 제출 : 일요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 월요일 전달

