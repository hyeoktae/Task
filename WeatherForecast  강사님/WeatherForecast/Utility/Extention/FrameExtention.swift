//
//  FrameExtention.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

extension CGRect {
    static var screenBounds: CGRect { return UIScreen.main.bounds }
    
    static func make(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

extension CGFloat {
    public static let screenWidth = UIScreen.main.nativeBounds.size.width  / UIScreen.main.nativeScale
    public static let screenHeight = UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale
}
