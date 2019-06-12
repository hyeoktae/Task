//
//  TrackCellCode.swift
//  TestRXAmalofire
//
//  Created by hyeoktae kwon on 2019/06/10.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class TrackCellCode: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        let views = [title, subTitle, imgView]
        views.forEach { self.addSubview($0) }
        autoLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func autoLayout() {
        let guide = self.contentView
        
        imgView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.3).isActive = true
        
        title.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        
        subTitle.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20).isActive = true
        subTitle.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
    }

}
