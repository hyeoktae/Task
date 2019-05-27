//
//  MainVC.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {
    
    // MARK: - MainVC's Properties & Configure
    private let loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        autoLayout()
        loginView.delegate = self
    }
    
    func autoLayout() {
        loginView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// choose the LoginViewDelegate
extension LoginVC: LoginViewDelegate {
    func presentSuccessLoginVC() {
        present(TestSuccessLoginVC(), animated: true) {
            ()
        }
    }
    
    func presentSignUp() {
        present(SignUpVC(), animated: true) {
            ()
        }
    }
}
