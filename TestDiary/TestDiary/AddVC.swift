//
//  AddVC.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol AddVCDelegate: class {
    func addData(title: String?, content: String?)
}

class AddVC: UIViewController {
    
    weak var delegate: AddVCDelegate?
    
    var backBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(" back ", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(15)
        btn.layer.borderWidth = 1
        btn.tag = 1
        btn.addTarget(self, action: #selector(buttons(_:)), for: .touchUpInside)
        return btn
    }()
    
    var addBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(20)
        btn.layer.borderWidth = 1
        btn.tag = 2
        btn.addTarget(self, action: #selector(buttons(_:)), for: .touchUpInside)
        return btn
    }()
    
    var titleLB: UILabel = {
       let label = UILabel()
        label.text = "제목 :"
        label.textAlignment = .center
        label.font = label.font.withSize(40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleTF: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.placeholder = "제목입력"
        tf.font = tf.font?.withSize(40)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var contents: UITextView = {
        let tv = UITextView()
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor.black.cgColor
        tv.font = .systemFont(ofSize: 20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backBTN)
        view.addSubview(titleLB)
        view.addSubview(contents)
        view.addSubview(titleTF)
        view.addSubview(addBTN)
        autoLayout()
    }
    
    func setContents(title: String?, contents: String?) {
        titleTF.text = title
        self.contents.text = contents
    }
    
    @objc func buttons(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else {
            return
        }
        switch sender.tag {
        case 1:
            presentingViewController?.dismiss(animated: true)
            addBTN.isEnabled = true
            addBTN.isHidden = false
        case 2:
            delegate?.addData(title: titleTF.text, content: contents.text)
            presentingViewController?.dismiss(animated: true)
        default:
            break
        }
        vc.header = nil
        vc.idx = nil
    }
    
    func autoLayout() {
        
        backBTN.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backBTN.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backBTN.bottomAnchor.constraint(equalTo: titleLB.topAnchor, constant: -20).isActive = true
        
        
        addBTN.topAnchor.constraint(equalTo: backBTN.topAnchor).isActive = true
        addBTN.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        addBTN.bottomAnchor.constraint(equalTo: backBTN.bottomAnchor).isActive = true
        addBTN.widthAnchor.constraint(equalTo: backBTN.widthAnchor).isActive = true
        
        titleLB.topAnchor.constraint(equalTo: backBTN.bottomAnchor, constant: 20).isActive = true
        titleLB.leadingAnchor.constraint(equalTo: backBTN.leadingAnchor).isActive = true
        titleLB.trailingAnchor.constraint(equalTo: titleTF.leadingAnchor, constant: 10).isActive = true
        titleLB.bottomAnchor.constraint(equalTo: contents.topAnchor, constant: -20).isActive = true
        titleLB.widthAnchor.constraint(equalTo: titleTF.widthAnchor, multiplier: 0.5).isActive = true
        
        titleTF.topAnchor.constraint(equalTo: titleLB.topAnchor).isActive = true
        titleTF.leadingAnchor.constraint(equalTo: titleLB.trailingAnchor, constant: -10).isActive = true
        titleTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        titleTF.bottomAnchor.constraint(equalTo: contents.topAnchor, constant: -20).isActive = true
        
        contents.topAnchor.constraint(equalTo: titleLB.bottomAnchor, constant: 20).isActive = true
        contents.leadingAnchor.constraint(equalTo: titleLB.leadingAnchor).isActive = true
        contents.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contents.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
