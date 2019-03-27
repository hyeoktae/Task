//
//  BeverageView.swift
//  ViewControllerTest2
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class BeverageView: UIView {

    let imageViewForBeverage: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let priceLabel: UILabel = UILabel()
    let purchaseButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    func layout() {
        self.backgroundColor = .black
        titleLabel.text = "Coke"
        
        self.addSubview(imageViewForBeverage)
        self.addSubview(titleLabel)
        self.addSubview(purchaseButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewForBeverage.frame = CGRect(x: 5, y: 5, width: self.frame.width - 10, height: 50)
        imageViewForBeverage.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        titleLabel.frame = CGRect(x: 5, y: 70, width: self.frame.width - 20, height: 30)
        purchaseButton.frame = CGRect(x: 5, y: 120, width: self.frame.width - 20, height: 50)
        purchaseButton.setTitle("구매하기", for: .normal)
        purchaseButton.setTitleColor(.black, for: .normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
