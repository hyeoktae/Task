//
//  Calculating.swift
//  BasicCalculator
//
//  Created by hyeoktae kwon on 19/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

enum Operators {
    static var num1 = Double()
    static var num2 = Double()
    
    static var add = {$0 + $1}(num1, num2)
    static var sub = {$0 - $1}(num1, num2)
    static var mul = {$0 * $1}(num1, num2)
    static var div = {$0 / $1}(num1, num2)
}

enum checkOper {
    static let add = "+"
    static let sub = "-"
    static let mul = "*"
    static let div = "/"
}

