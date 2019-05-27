//
//  SignUpVC.swift
//  Omok
//
//  Created by hyeoktae kwon on 28/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class SignUpVC: UIViewController {
    
    let signUpView: SignUpView = {
        let view = SignUpView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signUpView)
        autoLayout()
        signUpView.delegate = self
    }
    
    func autoLayout() {
        signUpView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// choose the SignUpViewDelegate
extension SignUpVC: SignUpViewDelegate {
    func imagePickerPresent() {
        present(signUpView.imagePicker, animated: true) {
            ()
        }
    }
    
    func cancel() {
        presentingViewController?.dismiss(animated: true, completion: {
            ()
        })
    }
}
