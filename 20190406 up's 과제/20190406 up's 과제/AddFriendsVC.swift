//
//  AddFriendsVC.swift
//  20190406 up's 과제
//
//  Created by hyeoktae kwon on 07/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol AddFriendsVCDelegate: class {
    func sender(_ text: String?)
}

class AddFriendsVC: UIViewController {
    
    @objc var addFriendsTextField = UITextField()
    
    weak var delegate: AddFriendsVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smallTitle()
        creatAddFriendsButton()
        creatAddFriendsTextField()
    }
    
    func creatAddFriendsTextField() {
        addFriendsTextField.frame = CGRect(x: 100, y: 400, width: view.frame.width - 200, height: 30)
        addFriendsTextField.placeholder = "이름을 입력하세요"
        addFriendsTextField.textAlignment = .center
        addFriendsTextField.tintAdjustmentMode = .automatic
        addFriendsTextField.tintColor = .black
        view.addSubview(addFriendsTextField)
    }
    
    func creatAddFriendsButton() {
        let addFriendsButton = UIButton()
        addFriendsButton.frame = CGRect(x: 100, y: 500, width: view.frame.width - 200, height: 50)
        addFriendsButton.setTitle("친구추가", for: .normal)
        addFriendsButton.backgroundColor = .gray
        addFriendsButton.addTarget(self, action: #selector(sendFriends(_:)), for: .touchUpInside)
        self.view.addSubview(addFriendsButton)
    }
    
    @objc func sendFriends(_ sender: Any) {
        if addFriendsTextField.text == "" {
            alert()
        } else {
            print("일 시킴")
            delegate?.sender(addFriendsTextField.text)
            addFriendsTextField.text = ""
        }
    }
    
    func alert() {
        let alertC = UIAlertController(title: "띠링", message: "이름이공백", preferredStyle: .alert)
        let nilName = UIAlertAction(title: "ㅇㅋ", style: .default)
        alertC.addAction(nilName)
        present(alertC, animated: true)
    }
    
    
    func smallTitle() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
}

