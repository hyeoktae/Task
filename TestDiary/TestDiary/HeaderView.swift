//
//  HeaderView.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 29/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
// 현재 헤더의 section을 담아서 보냄
protocol HeaderViewDelegate {
    func callHeader(idx: Int)
}
// 테이블뷰의 header , view 타입이다.
class HeaderView: UIView {

    var secIndex: Int?
    var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y
            , width: self.frame.width, height: self.frame.height))
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        return btn
    }()
    
    @objc func onClickHeaderView () {
        guard let idx = secIndex else {
            return
        }
        delegate?.callHeader(idx: idx)
    }
}
