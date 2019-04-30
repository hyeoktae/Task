//
//  SliderV.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SliderV: UIView {

    lazy var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = lb.font.withSize(20)
        return lb
    }()
    
    lazy var slider: UISlider = {
        let sd = UISlider()
        sd.translatesAutoresizingMaskIntoConstraints = false
        return sd
    }()
    
    init(frame: CGRect, text: String, tag: Int) {
        super.init(frame: frame)
        self.label.text = text
        self.slider.tag = tag
        self.addSubview(label)
        self.addSubview(slider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -15).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 15).isActive = true
        slider.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        slider.heightAnchor.constraint(equalTo: label.heightAnchor).isActive = true
    }

}
