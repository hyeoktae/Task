//
//  ViewController.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol LoginPageViewControllerDelegate: class {
    func changeLoginState() -> Bool
}

class LoginPageViewController: UIViewController {
    
    let ID: String = "tass"
    let PW: String = "1234"
    var stateLogin = false
    
    weak var delegate: LoginPageViewControllerDelegate?
    
    let afterLoginPage = AfterLoginPageViewController()
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var viewIDPW: UIView!
    
    @IBAction func toAfterLoginPage(_ sender: UIButton) {
        checkIDPW()
        goAfterLoginPage()
        stateLogin = delegate?.changeLoginState() ?? false
    }
    
    func keyboardID() {
        IDTextField.addTarget(self, action: #selector(keyboardOn(_:)), for: .editingDidBegin)
    }
    
    @objc func keyboardOn(_ sender: UITextField) {
        becomeFirstResponder()
        UIView.animate(withDuration: 0.2) {
            self.viewIDPW.frame.origin.y = 300
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        creatTripleSquare()
    }
    
    func goAfterLoginPage() {
        if stateLogin {
            afterLoginPage.delegate = self
            present(afterLoginPage, animated: true)
        } else {
            print("로그인실패")
            UIView.animate(withDuration: 0.1) {
                self.view.backgroundColor = .red
            }
            UIView.animate(withDuration: 0.1) {
                self.view.backgroundColor = .white
            }
        }
    }
    
    func creatTripleSquare() {
        let tripleSquare = TripleSquare()
        tripleSquare.frame = CGRect(x: view.frame.width/2-50, y: 180, width: 100, height: Padding.padding.padding)
        self.view.addSubview(tripleSquare)
    }
    
    func checkIDPW() {
        inputID.ID.ID = IDTextField.text ?? ""
        inputPW.PW.PW = PWTextField.text ?? ""
        
        if (self.ID == inputID.ID.ID) && (self.PW == inputPW.PW.PW){
            stateLogin = true
        }
    }
    
}

extension LoginPageViewController: AfterLoginPageViewControllerDelegate {
    func loginStateOrigin() -> Bool {
        return stateLogin
    }
    
    func loginInformation() -> String {
        return IDTextField.text ?? ""
    }
    
    
}
