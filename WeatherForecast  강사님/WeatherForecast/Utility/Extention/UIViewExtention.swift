//
//  UIViewExtention.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

extension UIView {
    
    
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let vc = nextResponder as? UIViewController {
                return vc
            }
        }
        return nil
    }
    
    
    func addSubViews(_ views: UIView...) {
        views.forEach {addSubview($0)}
    }
    
    var x: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    var y: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    var maxX: CGFloat {
        return x + width
    }
    var maxY: CGFloat {
        return y + height
    }
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    
}
