//
//  MenuCell.swift
//  CustomTabBar
//
//  Created by Wi on 18/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
