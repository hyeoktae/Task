//
//  ViewController.swift
//  TestDelegate
//
//  Created by hyeoktae kwon on 03/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
    }

}

