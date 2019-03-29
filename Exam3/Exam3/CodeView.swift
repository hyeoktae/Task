//
//  CodeView.swift
//  Exam3
//
//  Created by hyeoktae kwon on 29/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class CodeView: UIView {
    

    var myMoney: UILabel = UILabel()
    var willUseMoney: UILabel = UILabel()
    var myMoneyForWon: UILabel = UILabel()
    var willUseMoneyForWon: UILabel = UILabel()
    var toZero: UIButton = UIButton()
    var payMoney: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        creatToZero()
        creatMyMoney()
        creatPayMoney()
        createWillUseMoney()
        creatMyMoneyForWon()
        creatWillUseMoneyForWon()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myMoney.frame = CGRect(x: 20, y: 40, width: 80, height: 40)
        willUseMoney.frame = CGRect(x: 20, y: 90, width: 80, height: 40)
        myMoneyForWon.frame = CGRect(x: 110, y: 40, width: 140, height: 40)
        willUseMoneyForWon.frame = CGRect(x: 110, y: 90, width: 140, height: 40)
        toZero.frame = CGRect(x: 270, y: 40, width: 80, height: 40)
        payMoney.frame = CGRect(x: 270, y: 90, width: 80, height: 40)
    }
    
    func creatMyMoney() {
        myMoney.text = "소지금"
        myMoney.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        myMoney.textAlignment = .center
        self.addSubview(myMoney)
    }
    
    func creatMyMoneyForWon() {
        myMoneyForWon.text = "0원"
        myMoneyForWon.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        myMoneyForWon.textAlignment = .right
        self.addSubview(myMoneyForWon)
    }
    
    func creatWillUseMoneyForWon() {
        willUseMoneyForWon.text = "0원"
        willUseMoneyForWon.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        willUseMoneyForWon.textAlignment = .right
        self.addSubview(willUseMoneyForWon)
    }
    
    func createWillUseMoney() {
        willUseMoney.text = "결제금액"
        willUseMoney.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        willUseMoney.textAlignment = .center
        self.addSubview(willUseMoney)
    }
    
    func creatToZero() {
        toZero.setTitle("초기화", for: .normal)
        toZero.backgroundColor = .black
        toZero.setTitleColor(.white, for: .normal)
        toZero.tag = 4
        self.addSubview(toZero)
    }
    
    func creatPayMoney() {
        payMoney.setTitle("결제", for: .normal)
        payMoney.backgroundColor = .black
        payMoney.setTitleColor(.white, for: .normal)
        payMoney.tag = 5
        self.addSubview(payMoney)
    }
    
    
    
    
}
