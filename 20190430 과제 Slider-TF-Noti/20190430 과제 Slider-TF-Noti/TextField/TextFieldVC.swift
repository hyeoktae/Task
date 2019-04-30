//
//  TextFieldVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController {
    
    lazy var result = TextFieldResultVC()
    let notiCenter = NotificationCenter.default
    
    lazy var back: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("back", for: .normal)
        b.titleLabel?.font = b.titleLabel?.font.withSize(50)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        return b
    }()
    
    lazy var textField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.layer.borderWidth = 1
        t.font = t.font?.withSize(50)
        t.addTarget(self, action: #selector(goNext(_:)), for: .editingDidEndOnExit)
        return t
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(back)
        view.addSubview(textField)
        autoLayout()
        addObserver()
    }
    
    @objc func goNext(_ sender: UITextField) {
        let text = textField.text ?? ""
        NotificationCenter.default.post(name: Notification.Name("textNoti"), object: nil, userInfo: ["text":text])
        navigationController?.pushViewController(result, animated: true)
    }
    
    @objc func goToBack() {
        presentingViewController?.dismiss(animated: true)
    }
    
    func addObserver() {
        notiCenter.addObserver(result, selector: #selector(result.changeTextNoti(_:)), name: Notification.Name("textNoti"), object: nil)
    }
    
    func autoLayout() {
        back.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        back.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        back.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        back.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
    }

    deinit {
        notiCenter.removeObserver(self)
    }
    
}
