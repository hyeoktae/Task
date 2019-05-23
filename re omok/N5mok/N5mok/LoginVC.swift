//
//  LoginVC.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {
    
    let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "KakaoLogin"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginForKakao(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        autoLayout()
    }
    
    @objc func loginForKakao(_ sender: UIButton) {
        guard let session = KOSession.shared() else {return}
        
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler: { (error) in
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue) :
                        print("cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("Login Success")
                AppDelegate.instance.setupRootViewController()
            }
            
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(loginBtn)
        
        loginBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50).isActive = true
        loginBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
}
