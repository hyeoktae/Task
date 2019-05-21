//
//  checkWinner.swift
//  TestConcave
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var player1: Int8 = 0
var player2: Int8 = 0
var winner = false
var gameOver = false



protocol Piece {
    var stone: Int {get}
}

class Po: Piece {
    var stone: Int = 0
}

var binaryMap =
[
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0],
    ]

var firebaseData =
    [
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
]

var poMap =
    [
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()],
        [Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po(), Po()]
]





func saveStones(x: Int, y: Int, player: Bool) {
//    let po = poMap[x][y]
//    po.stone = player ? 2 : 1
    
    
    
    let databaseRef = Database.database().reference()
    let game = databaseRef.child("game").child("map")
    firebaseData[x][y] = player ? 2 : 1
    game.updateChildValues(["player1 vs player2":firebaseData])
    
//    checkStones()
//    var checkWinner:(Bool, Bool) = { return checkStones(x: x, y: y) }()
//    gameOver = checkWinner.0
//    winner = checkWinner.1
//    print("save's gameOver: \(checkWinner.0), winner: \(checkWinner.1)")
    
//    for i in poMap{
//        print("\n")
//        for jj in i{
//            print(jj.stone, terminator: "   ")
//        }
//    }
//    print("\n=================================\n")
}


func checkStones(){
    var count = 0
    for x in 0...10 {
         count = 0
        for y in 0...10 {
            if binaryMap[x][y] == 1 {
                count += 1
            } else {
                count = 0
            }
            if count == 5 {
                winner = false
                gameOver = true
                return
            }
        }
    }
    
    for y in 0...10 {
        count = 0
        for x in 0...10 {
            if binaryMap[x][y] == 1 {
                count += 1
            } else {
                count = 0
            }
            if count == 5 {
                winner = false
                gameOver = true
                return
            }
        }
    }
    
    for x in 0...6 {
        count = 0
        for y in 0...6 {
            var tempX = x
            var tempY = y
            for _ in 0..<5{
                if binaryMap[tempX][tempY] == 1 {
                    count += 1
                } else {
                    count = 0
                }
                tempX += 1
                tempY += 1
            }
            if count == 5 {
                winner = false
                gameOver = true
                return
            }
        }
    }
    
    for x in 0...6 {
        count = 0
        for y in 4...10 {
            var tempX = x
            var tempY = y
            for _ in 0..<5{
                if binaryMap[tempX][tempY] == 1 {
                    count += 1
                } else {
                    count = 0
                }
                tempX += 1
                tempY -= 1
            }
            if count == 5 {
                winner = false
                gameOver = true
                return
            }
        }
    }
    
    for x in 0...10 {
        count = 0
        for y in 0...10 {
            if binaryMap[x][y] == 2 {
                count += 1
            } else {
                count = 0
            }
            if count == 5 {
                winner = true
                gameOver = true
                return
            }
        }
    }
    
    for y in 0...10 {
        count = 0
        for x in 0...10 {
            if binaryMap[x][y] == 2 {
                count += 1
            } else {
                count = 0
            }
            if count == 5 {
                winner = true
                gameOver = true
                return
            }
        }
    }
    
    for x in 0...6 {
        count = 0
        for y in 0...6 {
            var tempX = x
            var tempY = y
            for _ in 0..<5{
                if binaryMap[tempX][tempY] == 2 {
                    count += 1
                } else {
                    count = 0
                }
                tempX += 1
                tempY += 1
            }
            if count == 5 {
                winner = true
                gameOver = true
                return
            }
        }
    }
    
    for x in 0...6 {
        count = 0
        for y in 4...10 {
            var tempX = x
            var tempY = y
            for _ in 0..<5{
                if binaryMap[tempX][tempY] == 2 {
                    count += 1
                } else {
                    count = 0
                }
                tempX += 1
                tempY -= 1
            }
            if count == 5 {
                winner = true
                gameOver = true
                return
            }
        }
    }
//    if count != 5 {
//        winner = false
//        gameOver = false
//    }
}





//func checkWinner() ->(Bool, Int) {
//    guard player1 == 5 || player2 == 5 else {
//        return (false, 0)
//    }
//    if player1 == 5 {
//        return (true, 1)
//    } else if player2 == 5 {
//        return (true, 2)
//    }
//    return (false, 0)
//}

//func checkStones() {
//
//    let lineX0 = binaryMap.filter{ $0.x == 0 }
//    let lineX1 = binaryMap.filter{ $0.x == 1 }
//    let lineX2 = binaryMap.filter{ $0.x == 2 }
//    let lineX3 = binaryMap.filter{ $0.x == 3 }
//    let lineX4 = binaryMap.filter{ $0.x == 4 }
//    let lineX5 = binaryMap.filter{ $0.x == 5 }
//    let lineX6 = binaryMap.filter{ $0.x == 6 }
//    let lineX7 = binaryMap.filter{ $0.x == 7 }
//    let lineX8 = binaryMap.filter{ $0.x == 8 }
//    let lineX9 = binaryMap.filter{ $0.x == 9 }
//    let lineX10 = binaryMap.filter{ $0.x == 10 }
//
//    let lineY0 = binaryMap.filter{ $0.y == 0 }
//    let lineY1 = binaryMap.filter{ $0.y == 1 }
//    let lineY2 = binaryMap.filter{ $0.y == 2 }
//    let lineY3 = binaryMap.filter{ $0.y == 3 }
//    let lineY4 = binaryMap.filter{ $0.y == 4 }
//    let lineY5 = binaryMap.filter{ $0.y == 5 }
//    let lineY6 = binaryMap.filter{ $0.y == 6 }
//    let lineY7 = binaryMap.filter{ $0.y == 7 }
//    let lineY8 = binaryMap.filter{ $0.y == 8 }
//    let lineY9 = binaryMap.filter{ $0.y == 9 }
//    let lineY10 = binaryMap.filter{ $0.y == 10 }
//
//    let allLines = [lineX0, lineX1, lineX2, lineX3, lineX4, lineX5, lineX6, lineX7, lineX8, lineX9, lineX10, lineY0, lineY1, lineY2, lineY3, lineY4, lineY5, lineY6, lineY7, lineY8, lineY9, lineY10]
//
//
//    for line in allLines {
//        for idx in 0..<line.count{
//            if line[idx].player {
//                if idx != 0{
//                    if !line[idx-1].player{
//                        player1 = 0
//                    }
//                }
//                player1 += line[idx].stone
//            } else if !line[idx].player {
//                if idx != 0 {
//                    if line[idx-1].player{
//                        player2 = 0
//                    }
//                }
//                player2 += line[idx].stone
//            }
//        }
//    }
//
//}
