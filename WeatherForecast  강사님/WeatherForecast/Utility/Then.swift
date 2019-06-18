//
//  Then.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

public protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
    func then(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}
