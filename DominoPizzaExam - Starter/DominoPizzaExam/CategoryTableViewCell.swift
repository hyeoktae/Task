//
//  CategoryTableViewCell.swift
//  DominoPizzaExam
//
//  Created by hyeoktae kwon on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate: class {
    func send(tableViewCell: UITableViewCell)
}

class CategoryTableViewCell: UITableViewCell {

    weak var delegate: CategoryTableViewCellDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        delegate?.send(tableViewCell: self)
    }
    
}


