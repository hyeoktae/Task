//
//  checkWinner.swift
//  TestConcave
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

var player1: Int8 = 0
var player2: Int8 = 0
var winner: Bool = false

protocol Piece {
    var player: Bool? {get}
}

class Po: Piece {
    var player: Bool? = nil
}

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
    let po = poMap[x][y]
    po.player = player
    checkStones(x: x, y: y)
    for i in poMap{
        print("\n")
        for jj in i{
            var pi: Int = 0
            if jj.player == true {
                pi = 1
            } else if jj.player == false {
                pi = 2
            } else {
                pi = 0
            }
            print(pi, terminator: "   ")
        }
    }
    print("\n=================================\n")
}


func checkStones(x: Int, y: Int) {
    
    var count = 0
    var cX = x
    var cY = y
    let origin = poMap[x][y].player
    
    while count != 5 {
        guard cX > 10 && cX < 0 else {
            count = 0
            break }
        guard poMap[cX][y].player != nil else {
            count = 0
            break }
        if origin == poMap[cX][y].player {
            count += 1
        } else {
            count = 0
        }
        cX += 1
    }
//    print("count", count)
    if count == 5 {
        winner = true
        return
    } else {
        count = 0
    }
    
    while count != 5 {
        guard cX > 10 && cX < 0 else {
            count = 0
            break }
        guard poMap[cX][y].player != nil else {
            count = 0
            break }
        if origin == poMap[cX][y].player {
            count += 1
        } else {
            count = 0
        }
        cX -= 1
    }
//    print("count", count)
    if count == 5 {
        winner = true
        return
    } else {
        count = 0
    }
    
    while count != 5 {
        guard cY < 10 && cY > 0 else {
            count = 0
            break }
        guard poMap[x][cY].player != nil else {
            count = 0
            break }
        if origin == poMap[x][cY].player {
            count += 1
        } else {
            count = 0
        }
        cY += 1
    }
//    print("count", count)
    if count == 5 {
        winner = true
        return
    } else {
        count = 0
    }
    
    while count != 5 {
        guard cY < 10 && cY > 0 else {
            count = 0
            break }
        guard poMap[x][cY].player != nil else {
            count = 0
            break }
        if origin == poMap[x][cY].player {
            count += 1
        } else {
            count = 0
        }
        cY -= 1
    }
//    print("count", count)
    if count == 5 {
        winner = true
        return
    } else {
        count = 0
    }
    
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
