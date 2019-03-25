
func twoNumbers(_ num1: Int, _ num2: Int) -> Int{
    
    var result = ""
    
    result = String(num1) + String(num2)
    
    
    return Int(result)!
}

print(twoNumbers(6, 100))



func twoString(_ word1: String, _ word2: String) -> Bool{
    
    if (word1 == word2){
        return true
    }else {
        return false
    }
}

print(twoString("ss1", "ss"))




func divisor(_ num1: Int){
    for i in 1...num1{
        if (num1 % i)==0{
            print(i, terminator: " ")
        }
    }
    print()
}

divisor(50)

func primeNumber(_ num1: Int) -> Bool{
    
    var abc = true
    
    if (num1 > 1){
    for i in 2...(num1-1){
        if (num1 % i == 0){
           abc = false
        }
    }
    }else {
        print("1입력금지")
    }
    return abc
}

print(primeNumber(55))



func fibonacci(_ num: Int) {
    var (x, y) = (0, 1)
    var addNum = 0
    
    switch num {
    case 1:
        print(0)
    case 2:
        print(1)
    default:
        for _ in 1...(num - 2) {
            addNum = x + y
            x = y
            y = addNum
        }
        print(addNum)
    }
}

fibonacci(6)


func printOutAll() {
    print("3과 5의 공배수 :", terminator: " ")
    for i in 1...100 {
        if (i % 3 == 0) && (i % 5 == 0) {
            print(i, terminator: " ")
        }
    }
}

printOutAll()

