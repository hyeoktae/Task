import UIKit

class Calculator {
    
    var accumulator: Double = 0
    
    func add(_ num: Double) -> Double{
        accumulator = accumulator + num
        return accumulator
    }
    func subtract(_ num: Double) -> Double{
        accumulator = accumulator - num
        return accumulator
    }
    func multiply(_ num: Double) -> Double{
        accumulator = accumulator * num
        return accumulator
    }
    func divide(_ num: Double) -> Double{
        accumulator = accumulator / num
        return accumulator
    }
    func reset() {
        accumulator = 0
    }
}

let calculator = Calculator()
calculator.add(6.0)




class Drink {
    let name = ""
    let maker = ""
    var price = 0
}


class machine {
    private var _money = 0
    
    func insert(_ money: Int) {
    var insertMoney: Int {
        get{
            return _money
        }
        set{
            _money = money
        }
    }
    }
    
    func change() {
        print(" \(_money)원이 반환되었습니다.")
        var insertMoney: Int {
            get{
                return _money
            }
            set{
                _money = newValue
            }
        }
        insertMoney = 0
    }
    
    func check() {
        var insertMoney: Int {
            get{
                return _money
            }
        }
        print("\(insertMoney)원이 남았습니다.")
    }
    
    
//    func sale(name: String) {
//        let drink = Drink(name: name, price: 1500, maker: "coca")
//        guard drink.price <= self._money else {
//            print("잔돈이 부족합니다.")
//            return
//        }
//    }
    
}










// 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.


class Dog {
    let name: String = ""
    var age: Int = 0
    var weight: Double = 0
    let kind: String = ""
    
    func bark(){
        print("멍")
    }
    func eat(){
        print("냠")
    }
}


class Student {
    let name = ""
    var age = 0
    var schoolName = ""
    var grade = 0
    
    func study(){
        print("공부")
    }
    func eat(){
        print("eat")
    }
    func sleep(){
        print("sleep")
    }
}


class Iphone {
    let modelName = ""
    var price = 0
    var faceID = false
    
    func call(){
        print("call")
    }
    func test(){
        print("text")
    }
}


class Coffee {
    let name = ""
    var price = 0
    let from = ""
}













