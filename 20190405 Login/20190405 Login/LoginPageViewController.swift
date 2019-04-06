//
//  ViewController.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    var rejectLogin = false
    
    let afterLoginPage = AfterLoginPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatTripleSquare()
    }
    
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var viewIDPW: UIView!
    
    @IBAction func toAfterLoginPage(_ sender: UIButton) {
        checkIDPWFromUD()
        if (!CheckLoginState.checkLoginState.checkLoginState()) || (rejectLogin) {
            UIView.animate(withDuration: 0.2) {
                self.IDTextField.backgroundColor = .red
                self.PWTextField.backgroundColor = .red
                self.IDTextField.backgroundColor = .white
                self.PWTextField.backgroundColor = .white
            }
        }
        goAfterLoginPage()
    }
    
    @IBAction func textController(_ sender: UITextField) {
        guard let count = sender.text?.count else {
            return
        }
        if count > 20 {
            sender.deleteBackward()
        } else if (count < 4) || (count > 16) {
            self.rejectLogin = true
        } else if (count > 4) || (count < 16) {
            self.rejectLogin = false
        }
        print(rejectLogin)
    }
    
    
    @IBAction func keyboardOn(_ sender: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.viewIDPW.frame.origin.y = 300
        }
        becomeFirstResponder()
    }
    
    @IBAction func keyboardOff(_ sender: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.viewIDPW.frame.origin.y = 444
        }
        resignFirstResponder()
    }
    
    
    func goAfterLoginPage() {
        print("세컨뷰: ", afterLoginPage)
        print(CheckLoginState.checkLoginState.checkLoginState())
        if CheckLoginState.checkLoginState.checkLoginState() {
            print("이건 실행 되는가?")
            afterLoginPage.delegate = self
            UserDefaults.standard.set(IDTextField.text, forKey: "LoginID")
            present(afterLoginPage, animated: true)
            self.rejectLogin = false
            
        }
        //        else {
        //            print("로그인실패")
        //            UIView.animate(withDuration: 0.1) {
        //                self.view.backgroundColor = .red
        //                self.viewIDPW.backgroundColor = .red
        //            }
        //            UIView.animate(withDuration: 0.1) {
        //                self.view.backgroundColor = .white
        //                self.viewIDPW.backgroundColor = .white
        //            }
        //        }
    }
    
    func creatTripleSquare() {
        let tripleSquare = TripleSquare()
        tripleSquare.frame = CGRect(x: view.frame.width/2-50, y: 180, width: 100, height: Padding.padding.padding)
        self.view.addSubview(tripleSquare)
    }
    
    
    func checkIDPWFromUD() {
        let PWFromUD = FindUsers.findUsers.findUsers(ID: IDTextField.text ?? "")
        if (PWFromUD == PWTextField.text ?? "") && (!rejectLogin){
            OnLoginState.onLoginState.onLoginState(ID: IDTextField.text ?? "")
        }
    }
    
    @IBAction func toSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    
    
    
    
    
}

extension LoginPageViewController: AfterLoginPageViewControllerDelegate {
    func loginInformation() -> String? {
        return UserDefaults.standard.object(forKey: "LoginID") as? String
    }
}
