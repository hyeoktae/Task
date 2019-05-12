//
//  ResultVC.swift
//  TestVision
//
//  Created by hyeoktae kwon on 13/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "result"
        label.font = label.font.withSize(50)
        return label
    }()
    
    var backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(" 다시하기 ", for: .normal)
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(toBack), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        autoLayout()
    }
    
    @objc func toBack() {
        presentingViewController?.dismiss(animated: true)
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(backBtn)
        view.addSubview(resultLabel)
        view.addSubview(imageView)
        
        backBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        backBtn.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        
        resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10).isActive = true
        
        imageView.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: resultLabel.topAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.8).isActive = true
        
        
    }
    

}
