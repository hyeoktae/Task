//
//  ViewController.swift
//  DelegateExample
//
//  Created by hyeoktae kwon on 04/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var uiVIew: CustomView!
    @IBOutlet weak var uiTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiVIew.backgroundColor = .gray
        uiVIew.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        uiVIew.backgroundColor = nil
    }
}


extension ViewController: CustomViewDelegate {
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else {
            return .gray
        }
        print("work")
        return color == .green ? .blue : color
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let color = uiTextField.text
        switch color {
        case "red":
            uiVIew.backgroundColor = .red
        case "blue":
            uiVIew.backgroundColor = .blue
        case "black":
            uiVIew.backgroundColor = .black
        default:
            uiVIew.backgroundColor = .gray
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


