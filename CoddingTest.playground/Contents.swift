import UIKit

var lastCharacter: Character? = nil
var pipeCount = 0
var laserCount = 0

func test(_ text: String) {
    for idx in text {
        if idx == "(" || idx ==  ")" {
        idx == lastCharacter ? (pipeCount += 1) : (laserCount += 1)
        lastCharacter = idx
        }
    }
    
    print("pipeCount: ", pipeCount/2)
    print("laserCount: ", laserCount/2)
}

test("()((()()()(())()))()")
