import UIKit

//: ##### 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func testNameAge(_ name: String, _ age: Int){
    print("안녕하세요 제 이름은 " + name + "이고, 나이는 " + String(age) + "입니다.")
}
testNameAge("권혁태", 29)


//: ##### 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

func testMultiple(_ multi: Int) -> String{
    let result = (multi % 2) == 0 ? "2의배수" : "2의배수아님"
    print (result)
    return result
}
testMultiple(90)


//: ##### 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수( 파라미터 하나의 기본 값은 10)

func testTwice(_ first: Int, _ second: Int=10) -> Int{
    let result = first * second
    print (result)
    return result
}
testTwice(3)

//: ##### 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func testAverage(_ one: Int, _ two: Int, _ three: Int, _ four: Int) -> Double{
    let result = Double(one+two+three+four)/4
    print (result)
    return result
}
testAverage(80, 29, 88, 98)


//: ##### 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)


//let testArray: [Any] = [1,2,"3"]
////testArray[2] as! Int
//type(of: testArray[0])
//print(testArray)
//
//func test01(_ testArray: Array<Any>){
////    let testArray = [1,2,"3"]
//    print(testArray)
//
//}





func testSchool (_ a: Any...) -> String{
    
        var score: Int = 0
//        var trans: Int = a as! Int
    var grade: String
    for index in 0..<a.count {
        if a[index] is Int {
            score += a[index] as! Int
            print(score)
        } else if a[index] is String {
            score += Int(a[index] as! String)!
            print(String(score)+", 2")
        }
    }
    
    score = score / (a.count)
    if (score >= 90) {
        grade = "A"
    }else if (score >= 80) {
        grade = "B"
    }else if (score >= 70) {
        grade = "C"
    }else {
        grade = "F"
    }
    print(grade)
    return grade
}

testSchool(88, "90", 60, "90")
//

//
//: ##### 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
// 위에가 답


