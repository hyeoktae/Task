//
//  Square.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class Square: UIView {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setConerRadius()
    }
    
    func setConerRadius() {
        self.layer.cornerRadius = 5
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
