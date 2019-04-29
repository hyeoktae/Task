//
//  MainView.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 29/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(40)
        btn.layer.cornerRadius = btn.frame.width/2
        btn.addTarget(self, action: #selector(clickAdd), for: .touchUpInside)
        btn.clipsToBounds = true // 안의 글자가 짤리지 않게
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        mainLabel.backgroundColor = .lightGray
        mainLabel.text = "일기장"
        mainLabel.textAlignment = .center
        mainLabel.font = mainLabel.font.withSize(20)
        return mainLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(mainLabel)
        self.addSubview(btn)
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickAdd() {
        let current: String = {
           return CurrentDate.shared.currentDate()
        }()
        print(current)
    }
    
    func autoLayout() {
        btn.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        btn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        btn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        btn.heightAnchor.constraint(equalTo: btn.heightAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    
}
