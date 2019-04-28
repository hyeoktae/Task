//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func reload()
}

final class DetailViewController: UIViewController {
    
    weak var delegate: DetailViewControllerDelegate?
    
    var imageView = UIImageView()
    var leftButton = UIButton(type: .system)
    var rightButton = UIButton(type: .system)
    var countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        AutoLayout()
        
    }
    
   
    
    @objc func updateCount(_ sender: UIButton) {
        
        guard let title = self.title, let count = Data.shared.countDict[title] else {
            return
        }
        
        switch sender.tag {
        case 1:
            if count != 0 {
                (Data.shared.countDict.updateValue((count-1), forKey: title))
            }
        case 2:
            Data.shared.countDict.updateValue(count+1, forKey: title)
            
        default:
            return
        }
        countLabel.text = "\(Data.shared.countDict[title] ?? 0) 개"
        print(Data.shared.countDict)
        delegate?.reload()
    }
    
    func AutoLayout() {
        
        view.addSubview(imageView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(countLabel)
        
        
        leftButton.setTitle("-", for: .normal)
        leftButton.tag = 1
        leftButton.addTarget(self, action: #selector(updateCount(_:)), for: .touchUpInside)
        
        
        rightButton.setTitle("+", for: .normal)
        rightButton.tag = 2
        rightButton.addTarget(self, action: #selector(updateCount(_:)), for: .touchUpInside)
        
        
        
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: countLabel.topAnchor, constant: -10).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.backgroundColor = .lightGray
        countLabel.textAlignment = .center
        countLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        countLabel.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        countLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.2).isActive = true
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.layer.borderWidth = 1
        leftButton.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        leftButton.titleLabel?.font = UIFont(name: "System", size: 30)
        leftButton.topAnchor.constraint(equalTo: countLabel.topAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: countLabel.heightAnchor).isActive = true
        leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        leftButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalTo: countLabel.widthAnchor, multiplier: 0.5).isActive = true
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.layer.borderWidth = 1
        rightButton.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        rightButton.titleLabel?.font = UIFont(name: "System", size: 30)
        rightButton.topAnchor.constraint(equalTo: countLabel.topAnchor).isActive = true
        rightButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        rightButton.heightAnchor.constraint(equalTo: leftButton.heightAnchor).isActive = true
        rightButton.widthAnchor.constraint(equalTo: countLabel.widthAnchor, multiplier: 0.5).isActive = true
        
    }
    
    
}
