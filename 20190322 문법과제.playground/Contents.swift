import UIKit


/*
 # 정수 하나를 입력받은 후, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
 * ex) 5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
*/
func oneToNow(_ number: Int) -> Int{
    
    var result: Int = 0
    
    if number >= 1{
        for i in 1...number{
            result = result + i
        }
    } else {
        for i in number...1{
            result = result + i
        }
    }
    
    return result
}

oneToNow(0)




/*
 # 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
 * e.g.  123 -> 6 ,  5678 -> 26
 */

func allAdd(_ number: Int) -> Int{
    
    var beforeResult = number
    var numberArray: [Int] = []
    var result: Int = 0
    
    repeat {
        numberArray.append(beforeResult % 10)
        beforeResult = beforeResult / 10
    } while (beforeResult != 0)
    
    for i in numberArray{
        result += i
    }
    
    return result
}

allAdd(4)



/*
 # 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
 * e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
 */


func threeSixNine(_ number: Int){
    
    var numberArray: [Int] = []
    
    for i in 1...number{
        
        var divNumber: Int = i
        
        repeat {
            numberArray.insert(divNumber % 10, at:0)
            divNumber = divNumber / 10
        } while (divNumber != 0)
        
        for j in numberArray{
            for l in numberArray.reversed() {
                
                if j == 3 || j == 6 || j == 9 || l == 3 || l == 6 || l == 9 {
                    print("*", terminator: " ")
                    numberArray = []
                    break
                } else {
                    print(i, terminator: " ")
                    numberArray = []
                    break
                }
            }
        }
    }
}

//threeSixNine(99)



/*
 # 하샤드 수 구하기
 * 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
 * e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.
 */

func hashad(_ number: Int) -> Bool{
    return number % allAdd(number) == 0
}

hashad(24)



/*
 # 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
 * e.g.  Input : 6, 9   ->  Output : 18, 3
 ### 최대공약수
 * 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
 * 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복
 ### 최소 공배수
 *  주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
 */

func twoNumbers(_ num1: Int, _ num2: Int){
    var n1 = num1
    var n2 = num2
    var n3 = 0
    
    var high = 0
    
    while high == 0 {
        if n2 < n1 {
            n3 = n2
            n2 = n1
            n1 = n3
        }
        if n1%n2 == 0{
            high = n2
        } else {
            n2 = n1
            n1 = n1%n2
        }
        
    }
    print(high)
    
    
//    while(n1 != 0){
//        if n2 > n1 {
//            n3 = n2
//            n2 = n1
//            n1 = n3
//        }
//        n1 = n1 - n2
//    }
//    print(num1*num2/n2, n2)
}
twoNumbers(6, 9)

