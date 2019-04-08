//
//  AfterLoginPageViewController.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol AfterLoginPageViewControllerDelegate: class {
    func loginInformation() -> String? 
}

class AfterLoginPageViewController: UIViewController {
    
    
    weak var delegate: AfterLoginPageViewControllerDelegate?
    let IDLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        creatSignOutButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        IDLabel.frame = CGRect(x: view.frame.width/2-100, y: 200, width: 200, height: 100)
        guard let ID = UserDefaults.standard.object(forKey: "LoginID") as? String else {
            print("이게작동되면 안대는디")
            IDLabel.text = delegate?.loginInformation()
            return
        }
        IDLabel.text = ID
        self.view.addSubview(IDLabel)
    }
    
    
    
    @objc func signOutButton(_ sender: UIButton) {
        OffLoginState.offLoginState.offLoginState()
        
        guard let beforeVC = presentingViewController as? LoginPageViewController else {
            print("beforeVC: nil")
            restartApplication()
            return
        }
        beforeVC.IDTextField.text = ""
        beforeVC.PWTextField.text = ""
        IDLabel.text = ""
        beforeVC.dismiss(animated: true)
    }
    
    func restartApplication() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 스토리보드를 객체로 받아와야 스토리보드상에서 만든 모든내용들을 가지고 쓸수있음
                storyboard.instantiateInitialViewController()         // 스토리보드에서 화살표가 지정된 뷰컨트롤러 불러오기
                guard let secondVC = storyboard.instantiateViewController(withIdentifier: "LoginPage") as? LoginPageViewController else {return}      // Identifier에 지정된 내용으로 뷰컨트롤러 불러오기
        
        //        secondVC.count        이렇게 스토리보드상에서 만들어진 뷰컨트롤러에 접근할수있음
        //        present(secondVC, animated : true)
        
        guard
            let window = UIApplication.shared.keyWindow
            else {
                return
        }
        
        UIView.transition(with: window, duration: 0.01, options: .transitionCrossDissolve, animations: {
            window.rootViewController = secondVC
        })
        
    }
}
