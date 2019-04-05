//
//  TripleSquare.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class TripleSquare: UIView {
    
    let square1 = Square()
    let square2 = Square()
    let square3 = Square()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        creatSquares()
    }
    
    func creatSquares() {
        self.addSubview(square1)
        self.addSubview(square2)
        self.addSubview(square3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        square1.frame = CGRect(x: 0, y: 0, width: Padding.padding.padding, height: Padding.padding.padding)
        square2.frame = CGRect(x: 40, y: 0, width: Padding.padding.padding, height: Padding.padding.padding)
        square3.frame = CGRect(x: 80, y: 0, width: Padding.padding.padding, height: Padding.padding.padding)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
