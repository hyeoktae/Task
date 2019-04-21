//
//  Buttons.swift
//  CalculatorExample
//
//  Created by hyeoktae kwon on 19/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

enum Operating {
    static var flag: Bool = false
    static var num1: Double = 0
    static var num2: Double = 0
    static var result: Double = 0
    
    
    
    static var add: Double {
        avoid();
        if flag {
            flag = false
            return { $0 + $1 }(num1, num2)
        }
        return result
    }
    static var sub: Double {
        avoid();
        if flag {
            flag = false
            return { $0 - $1 }(num1, num2)
        }
        return result
    }
    static var mul: Double {
        avoid();
        if flag {
            flag = false
            return { $0 * $1 }(num1, num2)
        }
        return result
    }
    static var div: Double {
        avoid();
        if flag {
            flag = false
            return { $0 / $1 }(num1, num2)
        }
        return result
    }
    
}

func avoid() {
    if Operating.num2 == 0 {
        Operating.num2 = Operating.num1
    }
}

enum checkOper {
    case add, div, sub, mul, none, eql
}
