import UIKit



func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)
//위와 같이 task1 이라는 변수가 있을 때 task1 + task2 의 결과가 제대로 출력되게 하라
let task2: Any = addTwoValues(a: 2, b: 3)

(task1 as! Int) + (task2 as! Int)

if let t1 = task1 as? Int, let t2 = task2 as? Int {
    print(t1 + t2)
}

// 도전과제
// let task2: Any = addTwoValues
// 위와 같이 task2 라는 변수가 있을 때 task2 + task2 의 결과가 제대로 출력되도록 할 것
// (addTwoValues 의 각 파라미터에는 2와 3 입력)

var result = (task2 as! Int) * 2

let task3: Any = addTwoValues(a: 2, b: 3)

(task3 as! Int) + (task3 as! Int)

func abc () {
    guard let t2 = task2 as? Int else {
        return
    }
    print(t2*2)
}

abc()

class Car {}
let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
//
//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
values[0]
type(of: values[0])
values[1]
type(of: values[1])
values[2]
type(of: values[2])
values[3]
type(of: values[3])
values[4]
type(of: values[4])


for i in values{
switch i {
case is Int:
    print(i as! Int)
case is String:
    print(i as! String)
case is Double:
    print(i as! Double)
case is (Double, Double):
    print(i as! (Double, Double))
case is Car:
    print(i as! Car)
default:
    print(i as! (String) -> Int)
}
}
