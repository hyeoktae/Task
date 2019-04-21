//
//  ViewController.swift
//  BasicCalculator
//
//  Created by hyeoktae kwon on 19/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let operNum1TF = UITextField()
    let operNum2TF = UITextField()
    let operTF = UITextField()
    let operNum1L = UILabel()
    let operNum2L = UILabel()
    let operL = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAll()
        
    }
    
    @objc func result() {
        
                if (operTF.text == checkOper.add) {
                    print(String(format: "%.3f", Operators.add))
                }
                if (operTF.text == checkOper.div) {
                    print(String(format: "%.3f", Operators.div))
                }
                if (operTF.text == checkOper.mul) {
                    print(String(format: "%.3f", Operators.mul))
                }
                if (operTF.text == checkOper.sub) {
                    print(String(format: "%.3f", Operators.sub))
                }
        
    }
    
    func makeButton() {
        button.frame = CGRect(x: 10, y: 170, width: 340, height: 50)
        button.backgroundColor = .black
        button.setTitle("결과 확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(result), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func makeAll() {
        makeOperNum1TF()
        makeOperNum2TF()
        makeOperTF()
        makeOperNum1L()
        makeOperNum2L()
        makeOperL()
        makeButton()
    }
    
    
    
    @objc func check(_ sender: UITextField) {
        if (sender.tag == 1) || (sender.tag == 2) {
        guard let num1 = Double(operNum1TF.text ?? ""), let num2 = Double(operNum2TF.text ?? "") else {
            print("숫자만 입력")
            return
        }
        print("숫자 입력됨")
        Operators.num1 = num1
        Operators.num2 = num2
        }
        if sender.tag == 3 {
        guard (operTF.text == checkOper.add) || (operTF.text == checkOper.div) || (operTF.text == checkOper.mul) || (operTF.text == checkOper.sub) else {
            print("연산자만 입력")
            return
        }
        print("연산자 입력됨")
        }
        
    }
    
    func makeOperNum1TF() {
        operNum1TF.frame = CGRect(x: 10, y: 100, width: 100, height: 30)
        operNum1TF.tintColor = .black
        operNum1TF.backgroundColor = .lightGray
        operNum1TF.textAlignment = .center
        operNum1TF.tag = 1
        operNum1TF.addTarget(self, action: #selector(check(_:)), for: .editingChanged)
        view.addSubview(operNum1TF)
    }
    
    func makeOperNum2TF() {
        operNum2TF.frame = CGRect(x: 240, y: 100, width: 100, height: 30)
        operNum2TF.tintColor = .black
        operNum2TF.backgroundColor = .lightGray
        operNum2TF.textAlignment = .center
        operNum2TF.tag = 2
        operNum2TF.addTarget(self, action: #selector(check(_:)), for: .editingChanged)
        view.addSubview(operNum2TF)
    }
    
    func makeOperTF() {
        operTF.frame = CGRect(x: 120, y: 100, width: 100, height: 30)
        operTF.tintColor = .black
        operTF.backgroundColor = .lightGray
        operTF.textAlignment = .center
        operTF.tag = 3
        operTF.addTarget(self, action: #selector(check(_:)), for: .editingChanged)
        view.addSubview(operTF)
    }
    
    
    func makeOperNum1L() {
        operNum1L.frame = CGRect(x: 10, y: 50, width: 100, height: 30)
        operNum1L.text = "피연산자1"
        operNum1L.textAlignment = .center
        view.addSubview(operNum1L)
    }
    
    func makeOperNum2L() {
        operNum2L.frame = CGRect(x: 240, y: 50, width: 100, height: 30)
        operNum2L.text = "피연산자2"
        operNum2L.textAlignment = .center
        view.addSubview(operNum2L)
    }
    
    func makeOperL() {
        operL.frame = CGRect(x: 120, y: 50, width: 100, height: 30)
        operL.text = "연산자"
        operL.textAlignment = .center
        view.addSubview(operL)
    }

}

