//
//  Singleton.swift
//  20190404  up's과제
//
//  Created by hyeoktae kwon on 06/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

class Red {
    static let red = Red()
    private init () {}
    var red: CGFloat = 0
}

class Green {
    static let green = Green()
    var green: CGFloat = 0
}

class Blue {
    static let blue = Blue()
    var blue: CGFloat = 0
}


