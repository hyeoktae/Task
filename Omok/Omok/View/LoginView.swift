//
//  LoginView.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

// delegate for Present
protocol LoginViewDelegate {
    func presentSignUp()
    func presentSuccessLoginVC()
}

final class LoginView: UIView {
    
    var delegate: LoginViewDelegate?
    
    // MARK: - LoginView's Property & Configure
    private let IDLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let IDTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let PWLabel: UILabel = {
        let label = UILabel()
        label.text = "PW"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let PWTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let LoginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapLoginBtn(_:)), for: .touchUpInside)
        return btn
    }()

    private let SignUpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("SignUp", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSignUpBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - LoginView's Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @objc private func didTapLoginBtn(_ sender: UIButton) {
        guard IDTF.text != "", PWTF.text != "" else {
            print("ID or PW are a nil")
            return
        }
        Networking.shared.tryLogin(id: IDTF.text!, pw: PWTF.text!) {
            $0 ? self.delegate?.presentSuccessLoginVC() : print("fail to Login")
        }
    }
    
    @objc private func didTapSignUpBtn(_ sender: UIButton) {
        delegate?.presentSignUp()
    }
    
    // MARK: - LoginView's layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        let guide = self.safeAreaLayoutGuide
        
        let properties = [IDLabel, IDTF, PWLabel, PWTF, LoginBtn, SignUpBtn]
        properties.forEach { self.addSubview($0) }
        
        IDLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        IDLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        IDLabel.trailingAnchor.constraint(equalTo: IDTF.leadingAnchor, constant: -20).isActive = true
        
        IDTF.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        IDTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        IDTF.widthAnchor.constraint(equalTo: IDLabel.widthAnchor, multiplier: 3).isActive = true
        
        PWLabel.topAnchor.constraint(equalTo: IDLabel.bottomAnchor, constant: 20).isActive = true
        PWLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        PWLabel.trailingAnchor.constraint(equalTo: PWTF.leadingAnchor, constant: -20).isActive = true
        
        PWTF.topAnchor.constraint(equalTo: IDTF.bottomAnchor, constant: 20).isActive = true
        PWTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        PWTF.widthAnchor.constraint(equalTo: PWLabel.widthAnchor, multiplier: 3).isActive = true
        
        LoginBtn.topAnchor.constraint(equalTo: PWTF.bottomAnchor, constant: 20).isActive = true
        LoginBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        SignUpBtn.topAnchor.constraint(equalTo: LoginBtn.bottomAnchor, constant: 20).isActive = true
        SignUpBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LoginView's Deinitialize
    deinit {
        
    }
    
}
