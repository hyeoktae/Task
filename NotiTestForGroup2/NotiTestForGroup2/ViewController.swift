//
//  ViewController.swift
//  NotiTestForGroup2
//
//  Created by hyeoktae kwon on 05/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
// 노티네임에 등록
extension ViewController {
    static var sendText: Notification.Name {
        return Notification.Name("noti")
    }
}

class ViewController: UIViewController {
    // 긴걸 조금이라도 덜 적으려고 함
    let notiCenter = NotificationCenter.default

    var tf: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.layer.borderWidth = 1
        t.backgroundColor = .lightGray
        // textfield.text 값이 변경 될 때 마다 작동
        t.addTarget(self, action: #selector(push(_:)), for: .editingChanged)
        // return 키 누르면 키보드 내려가게
        t.addTarget(self, action: #selector(nothing), for: .editingDidEndOnExit)
        return t
    }()
    
    var lV: LabelView = {
       let l = LabelView(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tf)
        view.addSubview(lV)
        autoLayout()
        addObserver()
    }
    // textfiel의 값이 바뀔때 마다 post함, userInfo에 값 넣어서 전달
    @objc func push(_ sender: UITextField) {
        notiCenter.post(name: ViewController.sendText, object: nil, userInfo: ["text":tf.text ?? ""])
    }
    // 옵저버 추가
    func addObserver() {
        // labelView에 있는 receiveText를 옵저버에 추가
        notiCenter.addObserver(lV, selector: #selector(lV.receiveText(_:)), name: ViewController.sendText, object: nil)
        // 키보드 나타날때 옵저버 등록
        notiCenter.addObserver(self, selector: #selector(keyBoard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        // 키보드 사라질때 옵저버 등록
        notiCenter.addObserver(self, selector: #selector(keyBoard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // 아무것도안함
    @objc func nothing() { }
    
    
    // 키보드 옵저버 등록 한 것
    @objc func keyBoard(_ noti: Notification) {
        // userInfo 간단히
        guard let userInfo = noti.userInfo,
            // 키보드의 cgrect값
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            // 키보드의 내려가거나 올라오는 속도 보통 0.25초
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }
        
        UIView.animate(withDuration: duration) {
            // view의 처음 y값이 0 이 아니라면 0으로(키보드는 내려감)
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
                // 반대 키보드 올라옴
            }else if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardFrame.height
            }
        }
    }
    

    func autoLayout() {
        lV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        lV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        lV.bottomAnchor.constraint(greaterThanOrEqualTo: tf.topAnchor, constant: -80).isActive = true
        lV.heightAnchor.constraint(equalTo: tf.heightAnchor).isActive = true
        
        tf.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tf.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tf.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        tf.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    // 이 vc가 사라지면 등록한 옵져버도 같이 사라짐
    deinit {
        notiCenter.removeObserver(self)
    }

}

