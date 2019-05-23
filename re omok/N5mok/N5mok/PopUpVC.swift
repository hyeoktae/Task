//
//  PopUpVC.swift
//  N5mok
//
//  Created by hyeoktae kwon on 23/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    var vs = String()
    let baseView = UIView()
    let titleLabel = UILabel()
    let yesBtn = UIButton()
    let noBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        configure()
        autoLayout()
    }
    private func configure() {
        baseView.backgroundColor = .gray
        baseView.layer.cornerRadius = 10
        view.addSubview(baseView)
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        yesBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        yesBtn.layer.cornerRadius = 25
        yesBtn.setTitle("네", for: .normal)
        yesBtn.addTarget(self, action: #selector(alertActionButtonAction), for: .touchUpInside)
        yesBtn.tag = 1
        view.addSubview(yesBtn)
        
        noBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        noBtn.layer.cornerRadius = 25
        noBtn.setTitle("뒤로", for: .normal)
        noBtn.addTarget(self, action: #selector(alertActionButtonAction), for: .touchUpInside)
        noBtn.tag = 2
        view.addSubview(noBtn)
    }
    
    private struct Standard {
        static let space: CGFloat = 30
    }
    
    private func autoLayout() {
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        baseView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        baseView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        baseView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: Standard.space).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        
        yesBtn.translatesAutoresizingMaskIntoConstraints = false
        yesBtn.leadingAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.leadingAnchor, constant: Standard.space).isActive = true
        yesBtn.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -Standard.space).isActive = true
        yesBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        yesBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        noBtn.translatesAutoresizingMaskIntoConstraints = false
        noBtn.trailingAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.trailingAnchor, constant: -Standard.space).isActive = true
        noBtn.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -Standard.space).isActive = true
        noBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        noBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func alertActionButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            initializePlayer(text: "\(vs)님과 오목을 시작합니다.", vc: self)
        case 2:
            dismiss(animated: true)
        default:
            break
        }
        
    }
    
}

