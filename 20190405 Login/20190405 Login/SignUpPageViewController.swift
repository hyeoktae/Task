//
//  SignUpPageViewController.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 06/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIViewController {
    
    var textState = false
    
    @IBOutlet var IDTextField: UITextField!
    @IBOutlet var PW1TextField: UITextField!
    @IBOutlet var PW2TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func checkPW() -> Bool {
        return PW1TextField.text == PW2TextField.text
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func textController(_ sender: UITextField) {
        guard let count = sender.text?.count else {
            return
        }
        if count > 20 {
            sender.deleteBackward()
        } else if (count < 4) || (count > 16) {
            self.textState = false
        } else if (count > 4) || (count < 16) {
            self.textState = true
        }
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        print("checkPW: ", checkPW())
        if textState && checkPW() {
            guard let ID = IDTextField.text, let PW = PW1TextField.text else {
                print("작동안함")
                return
            }
            print("작동함")
            SaveUsers.saveUsers.saveUsers(ID: ID, PW: PW)
            presentingViewController?.dismiss(animated: true)
        }
        
    }
    

  

}
