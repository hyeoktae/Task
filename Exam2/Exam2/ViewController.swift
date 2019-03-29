//
//  ViewController.swift
//  Exam2
//
//  Created by hyeoktae kwon on 29/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pw: UITextField = UITextField()
    var toggle: UISwitch = UISwitch()
    var password: String = ""
    let originPW: String = "qwer"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatPw()
        creatToggle()
    }

    func creatPw() {
        pw.frame = CGRect(x: 20, y: 70, width: 120, height: 30)
        pw.placeholder = "비번 입력"
        view.addSubview(pw)
        pw.isSecureTextEntry = true
        pw.addTarget(self, action: #selector(checkPW), for: .editingChanged)
        pw.addTarget(self, action: #selector(onExit), for: .editingDidEndOnExit)
    }
    
    func creatToggle() {
        toggle.frame = CGRect(x: 20, y: 120, width: 50, height: 40)
        toggle.isEnabled = false
        view.addSubview(toggle)
    }
    
    @objc func checkPW() {
        password = (pw.text) ?? ""
        if password == originPW {
            toggle.isOn = true
        } else if password != originPW {
            toggle.isOn = false
        }
    }
    
    @objc func onExit(){
        if toggle.isOn == true {
            let secondVC = SecondViewController()
            secondVC.passwordForSecondVC = password
            present(secondVC, animated: true)
        }
    }
    
}

