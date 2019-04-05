//
//  PublicValues.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

public class Padding {
    static let padding = Padding()
    private init() {}
    let padding: CGFloat = 20
}

public class inputID {
    static let ID = inputID()
    private init () {}
    var ID: String = ""
}

public class inputPW {
    static let PW = inputPW()
    private init () {}
    var PW: String = ""
}
