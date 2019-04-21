//
//  Calculating.swift
//  CalculatorTest
//
//  Created by hyeoktae kwon on 19/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation


enum Operators {
    
    static var num1: Double = 2
    static var num2: Double = 3
    
    static var add2 = {$0 + $1}(num1, num2)
}


