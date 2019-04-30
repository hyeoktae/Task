//
//  TextFieldResultVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let textNoti = Notification.Name("textNoti")
}

class TextFieldResultVC: UIViewController {
    
    let label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        l.font = l.font?.withSize(50)
        //        l.text = " "
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        autoLayout()
    }
    
    @objc func changeTextNoti(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String:String] else {
            return
        }
        label.text = userInfo["text"] == "" ? " " : userInfo["text"]!
    }
    
    func autoLayout() {
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }

}
