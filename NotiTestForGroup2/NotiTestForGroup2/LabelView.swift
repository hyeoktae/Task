//
//  LabelView.swift
//  NotiTestForGroup2
//
//  Created by hyeoktae kwon on 05/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class LabelView: UIView {
    
    var label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        autoLayout()
    }
    // 스토리보드에서 사용할수 없다 라는
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // 등록한 옵저버가 post될 때 마다 감지하여 이 함수 실행 userinfo에 딸려오는 값을 사용함
    @objc func receiveText(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String:String] else { return }
        label.text = userInfo["text"]
    }
    
    
    func autoLayout() {
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
