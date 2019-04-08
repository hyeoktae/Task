//
//  ColorModule.swift
//  20190404  up's과제
//
//  Created by hyeoktae kwon on 06/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ColorModule: UIView {

    @objc let colorView = UILabel()
    @objc let slider = UISlider()
    
    init(frame: CGRect, colorText: String, color: UIColor, tag: Int) {
        super.init(frame: frame)
        colorView.backgroundColor = color
        colorView.text = colorText
        colorView.textColor = .white
        slider.tag = tag
        self.addSubview(colorView)
        self.addSubview(slider)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/3)
        slider.frame = CGRect(x: 0, y: self.frame.height/1.5, width: self.frame.width, height: self.frame.height/3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
