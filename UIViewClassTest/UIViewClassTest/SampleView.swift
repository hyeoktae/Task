//
//  SampleClass.swift
//  UIViewClassTest
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SampleView: UIView {

    let champButton: UIButton = UIButton()
    let nameLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        self.addSubview(champButton)
        self.addSubview(nameLabel)
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        champButton.frame = CGRect(x: 10, y: 10, width: self.frame.width - 20, height: self.frame.height - 50)
        nameLabel.frame = CGRect(x: 10, y: champButton.frame.height + 20, width: self.frame.width - 20, height: 20)
        
    }
    
}
