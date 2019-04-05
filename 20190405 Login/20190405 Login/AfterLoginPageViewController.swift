//
//  AfterLoginPageViewController.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol AfterLoginPageViewControllerDelegate: class {
    func loginInformation() -> String
    func loginStateOrigin() -> Bool
}

class AfterLoginPageViewController: UIViewController {
    
    var loginState = false
    
    weak var delegate: AfterLoginPageViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginState = delegate?.loginStateOrigin() ?? false
        creatSignOutButton()
        creatIDLabel()
    }
    
    func creatSignOutButton() {
        let signOutButton = UIButton()
        signOutButton.frame = CGRect(x: view.frame.width - Padding.padding.padding - 100, y: 70, width: 100, height: 50)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.backgroundColor = .blue
        signOutButton.addTarget(self, action: #selector(signOutButton(_:)), for: .touchUpInside)
        self.view.addSubview(signOutButton)
    }
    
    func creatIDLabel() {
        let IDLabel = UILabel()
        IDLabel.frame = CGRect(x: view.frame.width/2-100, y: 200, width: 200, height: 100)
        IDLabel.text = delegate?.loginInformation()
        self.view.addSubview(IDLabel)
    }
    
    
    
    @objc func signOutButton(_ sender: UIButton) {
        inputID.ID.ID = ""
        inputPW.PW.PW = ""
        loginState = false
        
        guard let beforeVC = presentingViewController as? LoginPageViewController else {
            print("beforeVC: nil")
            return
        }
        beforeVC.delegate = self
        
        presentingViewController?.dismiss(animated: true)
    }
}

extension AfterLoginPageViewController: LoginPageViewControllerDelegate {
    
    func changeLoginState() -> Bool {
        print("실행")
        return loginState
    }
}
