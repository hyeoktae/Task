//
//  OmokGameCell.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class OmokGameCell: UICollectionViewCell {
    
   
    
    let scrollBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .yellow
        
        
        setAutoLayout()
        configure()
        
    }
    
    
    func setAutoLayout() {
        contentView.addSubview(scrollBtn)
        scrollBtn.translatesAutoresizingMaskIntoConstraints = false
        scrollBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scrollBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        scrollBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        scrollBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
    
    func configure() {
        scrollBtn.setTitle("채팅하기", for: .normal)
        scrollBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        scrollBtn.setTitleColor(.white, for: .normal)
        scrollBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        scrollBtn.layer.cornerRadius = 7
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
    }
    
}
