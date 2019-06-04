//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/***************************************************
 Basic
 ***************************************************/
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization

let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]

let name = jsonObject!["name"] as? String
let age = jsonObject!["age"] as? Int

print("name: ", name!, ", age: ", age!)

// JSONDecoder

struct test: Codable {
    let name: String
    let age: Int
}

let jsonDecoded = try? JSONDecoder().decode(Dog.self, from: jsonData)

print(jsonDecoded!)


/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Summer", "age": 5 },
  ]
  """.data(using: .utf8)!


// JSONSerialization

let jsonObject1 = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]]

var resultArr = [Dog]()

for idx in jsonObject1! {
    let name = idx["name"] as? String
    let age = idx["age"] as? Int
    resultArr.append(Dog(name: name!, age: age!))
}

resultArr.forEach { print($0) }

// JSONDecoder

let jsonDecoded1 = try? JSONDecoder().decode([Dog].self, from: jsonArrData)

jsonDecoded1?.forEach { print($0) }


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Summer", "age": 5 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization
var dogArr = [Dog]()
var resultDict = [String: [Dog]]()


let jsonObject2 = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: [[String: Any]]]

for idx in jsonObject2! {
    let key = idx.key
    let value = idx.value
    for idx2 in value {
        let name = idx2["name"] as? String
        let age = idx2["age"] as? Int
        dogArr.append(Dog(name: name!, age: age!))
    }
    resultDict.updateValue(dogArr, forKey: key)
}

resultDict.forEach {$0.value.forEach{ print($0) } }




// JSONDecoder

let jsonDecoded2 = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData)

jsonDecoded2?.forEach { $0.value.forEach { print($0) } }





/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/***************************************************
 Basic
 ***************************************************/
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {
  
  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
