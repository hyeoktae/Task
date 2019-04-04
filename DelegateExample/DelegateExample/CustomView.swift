//
//  CustomView.swift
//  DelegateExample
//
//  Created by hyeoktae kwon on 04/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

class CustomView: UIView {
    
    weak var delegate: CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            
            let color2 = delegate?.colorForBackground(newValue)
            
            // 커스터마이징 포인트 - 새로 들어온 color를 받아서 color를 리턴
            // 커스터마이징 불가능 포인트 - 그 외 전부
            
            let newColor = color2 ?? newValue ?? .black
            super.backgroundColor = newColor
            
//            var color = newColor
//            if color == .red {
//                color = .blue
//            }
            
//            super.backgroundColor = color
//            print("new color is ", color)
        }
    }
}
