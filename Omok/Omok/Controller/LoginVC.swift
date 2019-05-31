//
//  MainVC.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {
    
    let waitRoomVC = WaitRoomVC()
    
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
    func presentSuccessLoginVC(ID: String, PW: String) {
        Networking.shared.tryLogin(id: ID, pw: PW) {
            if $0 {
                Networking.shared.downloadMyInfo(ID: ID, completion: {
                    self.waitRoomVC.waitRoomView.IDlabel.text = Users.shared.myLoginInfo.nickName
                    self.waitRoomVC.waitRoomView.profileImg.image = Users.shared.myLoginInfo.playerImg
                    print("nickName: ", Users.shared.myLoginInfo.nickName)
                })
            }
            $0 ? self.present(self.waitRoomVC, animated: true) : print("fail to Login")
        }
    }
    
    func presentSignUp() {
        present(SignUpVC(), animated: true) {
            ()
        }
    }
}
