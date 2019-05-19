//
//  checkWinner.swift
//  TestConcave
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

protocol Piece {
    var x: Int8 {get}
    var y: Int8 {get}
    var stone: Int8 {get}
    var player: Bool {get}
}

struct Point: Piece {
    var x: Int8
    var y: Int8
    var stone: Int8
    var player: Bool
}

var binaryMap = [Point]()

var lineX0 = binaryMap.filter{ $0.x == 0 }
var lineX1 = binaryMap.filter{ $0.x == 1 }
var lineX2 = binaryMap.filter{ $0.x == 2 }
var lineX3 = binaryMap.filter{ $0.x == 3 }
var lineX4 = binaryMap.filter{ $0.x == 4 }
var lineX5 = binaryMap.filter{ $0.x == 5 }
var lineX6 = binaryMap.filter{ $0.x == 6 }
var lineX7 = binaryMap.filter{ $0.x == 7 }
var lineX8 = binaryMap.filter{ $0.x == 8 }
var lineX9 = binaryMap.filter{ $0.x == 9 }
var lineX10 = binaryMap.filter{ $0.x == 10 }

var lineY0 = binaryMap.filter{ $0.y == 0 }
var lineY1 = binaryMap.filter{ $0.y == 1 }
var lineY2 = binaryMap.filter{ $0.y == 2 }
var lineY3 = binaryMap.filter{ $0.y == 3 }
var lineY4 = binaryMap.filter{ $0.y == 4 }
var lineY5 = binaryMap.filter{ $0.y == 5 }
var lineY6 = binaryMap.filter{ $0.y == 6 }
var lineY7 = binaryMap.filter{ $0.y == 7 }
var lineY8 = binaryMap.filter{ $0.y == 8 }
var lineY9 = binaryMap.filter{ $0.y == 9 }
var lineY10 = binaryMap.filter{ $0.y == 10 }


func checkWinner() {
    
}
