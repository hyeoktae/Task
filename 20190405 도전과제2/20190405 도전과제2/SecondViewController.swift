//
//  SecondViewController.swift
//  20190405 도전과제2
//
//  Created by hyeoktae kwon on 07/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    var textForLabel: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondLabel.text = textForLabel // label.text에 firstVC에서 가져온(매개변수를통해) 값을 넣음
    }
    
//    firstVC.delegate = self
    
    @IBAction func toFirstVC(_ sender: UIButton) {
        guard let firstVC = presentingViewController as? FirstViewController else {
            return
        }
        firstVC.firstTextField.text = "" // firstVC의 textField값 초기화, 안해도 무방
        firstVC.dismiss(animated: true) // 초기화 후 dismiss, unwind써도 무방
    }
}

extension SecondViewController: FirstViewControllerDelegate { // 일 하는 부분
    func textSender(_ text: String?){ // 일 시킬때 text에다가 textfield.text를 같이 준다.
        print("일한다")
        textForLabel = text // 일 한다, secondVC에 가지고 있는 String변수에 text넣음
        return
    }
}
