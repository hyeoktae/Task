//
//  OtherCell.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/11.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class OtherCell: UITableViewCell {
    
    let date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.textColor = .white
        return label
    }()
    
    let time: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(25)
        label.textColor = .white
        return label
    }()
    
    let temp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50, weight: .light)
        label.textColor = .white
        return label
    }()
    
    let sky: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func addSubviews() {
        let views = [sky, temp, time, date]
        views.forEach { self.addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews()
        
        date.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -3).isActive = true
        date.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        time.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        time.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        sky.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sky.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 30).isActive = true
        sky.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        sky.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        temp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        temp.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
