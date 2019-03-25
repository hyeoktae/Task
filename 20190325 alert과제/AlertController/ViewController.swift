//
//  ViewController.swift
//  AlertController
//
//  Created by hyeoktae kwon on 25/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var codeButton: UIButton = UIButton(type: .system)
    var numberLabel: UILabel = UILabel()
    var number: Int = 0
    var inputTextNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeButton.frame = CGRect(x: 200, y: 600, width: 150, height: 30)
        codeButton.setTitle("버튼", for: .normal)
        codeButton.addTarget(self, action: #selector(button(_:)), for: .touchUpInside)
        
        numberLabel.frame = CGRect(x: 150, y: 100, width: 600, height: 300)
        numberLabel.text = "0"
        
        view.addSubview(codeButton)
        view.addSubview(numberLabel)
        
    }
    
    @objc func button(_ sender: UIButton) {
        let alertController = UIAlertController(title: "카운트", message: "숫자만 입력하시오", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "up", style: .default) { (_) in
            self.number += 1
            self.upDown()
        }
        
        let cancelAction = UIAlertAction(title: "reset", style: .cancel) { (_) in
            self.number = 0
            self.upDown()
        }
        
        let voidAction = UIAlertAction(title: "down", style: .destructive) { (_) in
            self.number -= 1
            self.upDown()
        }
        
        let confirm = UIAlertAction(title: "text창 값 추가", style: .default) { (_) in
            if alertController.textFields?.first?.text != nil{
                self.inputTextNumber = (alertController.textFields?.first?.text)!
                if (Int(self.inputTextNumber)) != nil{
                    self.number += (Int(self.inputTextNumber))!
                }else {
                    self.alert1()
                }
            }
            
            self.upDown()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(voidAction)
        alertController.addTextField()
        alertController.addAction(confirm)
        
        present(alertController, animated: true)
    }
    
    func upDown(){
        numberLabel.text = String(number)
    }
    
    func alert1() {
        let textAlertController = UIAlertController(title: title, message: "숫자만 입력하라고 ㅡㅡ", preferredStyle: .alert)
        
        let okActionForText = UIAlertAction(title: "OK", style: .destructive) { (_) in
        }
        
        textAlertController.addAction(okActionForText)
        
        present(textAlertController, animated: true)
    }
}

