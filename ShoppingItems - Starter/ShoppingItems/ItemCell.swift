//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func addCount(_ itemCell: ItemCell, didTapButton: UIButton)
}

final class ItemCell: UITableViewCell {
  
    weak var delegate: ItemCellDelegate?
    let button = UIButton(type: .contactAdd)
    let stock = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        contentView.addSubview(stock)
        button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
    }
    
    @objc func click(_ sender: UIButton) {
        delegate?.addCount(self, didTapButton: sender)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: frame.width - 30, y: frame.height/2-10, width: 20, height: 20)
        stock.frame = CGRect(x: frame.width - 50, y: frame.height/2-10, width: 30, height: 20)
        stock.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
}
