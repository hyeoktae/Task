//
//  ViewController.swift
//  20190405 도전과제2
//
//  Created by hyeoktae kwon on 07/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class { // 일 시킬 조건
    func textSender(_ text: String?) // 일 시킬 조건
}

class FirstViewController: UIViewController {
    var test:String? = ""
    
    @IBOutlet weak var firstTextField: UITextField!
    
    weak var delegate: FirstViewControllerDelegate? // 채용공고
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        self.delegate = secondVC // 일 시키기 전에 계약서 작성(내가 가지고 있는 채용공고를 secondVC가 일 한다는내용)
        beWork() // 실제 일 하는 함수 실행
    }
    
    func beWork() {
        delegate?.textSender(firstTextField.text) // 일 시킨다, 일 시킬때 textField.text도 같이 준다. 매개변수로 전달
    }
    
    @IBAction func toSecondVC(_ sender: UIButton) {
        performSegue(withIdentifier: "toSecondVC", sender: self)
    }
   
    
}

