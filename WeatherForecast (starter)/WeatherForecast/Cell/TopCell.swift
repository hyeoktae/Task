//
//  TopCell.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/11.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class TopCell: UITableViewCell {
    
    let weatherIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(40)
        label.textColor = .white
        return label
    }()
    
    let minIcon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(30)
        label.textColor = .white
        return label
    }()
    
    let minTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(30)
        label.textColor = .white
        return label
    }()
    
    let maxIcon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(30)
        label.textColor = .white
        return label
    }()
    
    let maxTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(30)
        label.textColor = .white
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 150, weight: .ultraLight)
        label.textColor = .white
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    deinit {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let views = [weatherIcon, weatherLabel, minIcon, maxIcon, tempLabel, minTemp, maxTemp]
        views.forEach { self.addSubview($0) }
        
        let guide = self.safeAreaLayoutGuide
        
        tempLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tempLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        
        minIcon.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        minIcon.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: -10).isActive = true
        
        minTemp.leadingAnchor.constraint(equalTo: minIcon.trailingAnchor, constant: 5).isActive = true
        minTemp.bottomAnchor.constraint(equalTo: minIcon.bottomAnchor).isActive = true
        
        maxIcon.leadingAnchor.constraint(equalTo: minTemp.trailingAnchor, constant: 5).isActive = true
        maxIcon.bottomAnchor.constraint(equalTo: minTemp.bottomAnchor).isActive = true
        
        maxTemp.leadingAnchor.constraint(equalTo: maxIcon.trailingAnchor, constant: 5).isActive = true
        maxTemp.bottomAnchor.constraint(equalTo: maxIcon.bottomAnchor).isActive = true
        
        weatherIcon.bottomAnchor.constraint(equalTo: minIcon.topAnchor, constant: -10).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        weatherIcon.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.2).isActive = true
        weatherIcon.heightAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.2).isActive = true
        
        weatherLabel.bottomAnchor.constraint(equalTo: minIcon.topAnchor, constant: -10).isActive = true
        weatherLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 5).isActive = true
    }
    
}
