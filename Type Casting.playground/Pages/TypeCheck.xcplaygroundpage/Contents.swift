//: [Previous](@previous)
/*:
 # Type Check
 */

/*:
 ---
 ## 타입 확인 - type(of: )
 ---
 */
print("\n---------- [ type(of:) ] ----------\n")

type(of: 1)
type(of: 2.0)
type(of: "3")


// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])


// Generic
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")



/*:
 ---
 ## 타입 비교 - is
 ---
 */
print("\n---------- [ is ] ----------\n")

/***************************************************
 객체 is 객체의 타입  -> true or false
 ***************************************************/

let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}

if strArr[0] is Int {
  "Int"
}



let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
    if data is Int{
        "Int"
    } else if data is String {
        "String"
    } else {
        "Double"
    }
}




/*:
 ---
 ## 상속 관계
 ---
 */
print("\n---------- [ Subclassing ] ----------\n")

class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}

let student = Student()
student is Human
student is Baby
student is Student

let univStudent = UniversityStudent()
univStudent is Student
student is UniversityStudent


/***************************************************
 자식 클래스 is 부모 클래스  -> true
 부모 클래스 is 자식 클래스  -> false
 ***************************************************/


let babyArr = [Baby()]
type(of: babyArr)   // [Baby] 타입,   strArr = ["1", "2"] 와 마찬가지


// Q. 그럼 다음 someArr 의 Type 은?

let someArr = [Human(), Student(), Baby(), UniversityStudent()]
type(of: someArr)


someArr[0] is Human    //
someArr[0] is Student  //
someArr[0] is UniversityStudent  //
someArr[0] is Baby     //

someArr[1] is Human    //
someArr[1] is Student  //
someArr[1] is UniversityStudent  //
someArr[1] is Baby     //

someArr[2] is Human    //
someArr[2] is Student  //
someArr[2] is UniversityStudent  //
someArr[2] is Baby     //

someArr[3] is Human    //
someArr[3] is Student  //
someArr[3] is UniversityStudent  //
someArr[3] is Baby     //




var human: Human = Student()

// Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
//type(of: human)
//human.name    //
//human.school  //


// Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
//human = Baby()
//human = UniversityStudent()


var james = Student()
james = UniversityStudent()
//james = Baby()    //

// Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
//james.name     // Human 속성
//james.age      // Baby 속성
//james.school   // Student 속성
//james.univName // UniversityStudent 속성


// Q. 그럼 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요


//: [Next](@next)
