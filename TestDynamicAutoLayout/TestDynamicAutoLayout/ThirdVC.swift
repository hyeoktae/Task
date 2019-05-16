//
//  ThirdVC.swift
//  TestDynamicAutoLayout
//
//  Created by hyeoktae kwon on 16/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class ThirdVC: UIViewController {
    private var attrString = NSAttributedString( // 어떤속성을 문자열에 적용
        string: ".slack.com",
        attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
    )
    
    private var warningString = NSAttributedString( // 어떤속성을 문자열에 적용
        string: "This URL is not available. Sorry bro!",
        attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
    )
    
    private let warningLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14, weight: .light)
        l.alpha = 0.0
        return l
    }()
    private var warningLabelLeadingConst: NSLayoutConstraint!
    
    private let moveLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 22, weight: .light)
        return l
    }()
    private var moveLabelLeadingConst: NSLayoutConstraint!
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.blue, for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeImage = UIImage(named: "btnBack")!
        button.setImage(closeImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let floatingLabel: UILabel = {
        let l = UILabel()
        l.text = "Get a URL (Letters, numbers, and dashes only)"
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        l.alpha = 1
        return l
    }()
    
    
    
    let wsNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
        textField.enablesReturnKeyAutomatically = true // 키보드 리턴키 동작안하게
        textField.borderStyle = .none
        textField.returnKeyType = .go // 키보드의 return을 go로 바꿈
        textField.autocorrectionType = .no // 자동완성 없앰
        textField.autocapitalizationType = .none // 첫문자 대문자로 하는거 없앰
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        return textField
    }()
    private var textFieldLeadingConst: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moveLabel.attributedText = attrString
        warningLabel.attributedText = warningString
        wsNameTextField.becomeFirstResponder()
        nextButton.isSelected = !wsNameTextField.text!.isEmpty
        
        guard let text = wsNameTextField.text else { return }
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        moveLabelLeadingConst.constant = textSize.width
    }
    
    private func vibration() {
        // kSystemSoundID_Vibrate  4095
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    func vibrationAnimation() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState], animations: {
            self.view.setNeedsLayout()
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.textFieldLeadingConst.priority = .defaultHigh
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.textFieldLeadingConst.priority = .defaultLow
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.textFieldLeadingConst.priority = .defaultHigh
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.textFieldLeadingConst.priority = .defaultLow
                self.view.layoutIfNeeded()
            })
        })
    }
    
    @objc func didTapNextBtn(_ sender: UIButton) {
        guard let text = wsNameTextField.text, text != "error" else {
            vibrationAnimation()
            downAnimate()
            return vibration() }
        upAnimate()
    }
    
    func downAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            self.warningLabelLeadingConst.priority = .defaultHigh
            self.warningLabel.alpha = 1.0
        })
    }
    
    func upAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            self.warningLabelLeadingConst.priority = .defaultLow
            self.warningLabel.alpha = 0.0
        })
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        guard let text = wsNameTextField.text else { return }
        
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        moveLabelLeadingConst.constant = textSize.width
        nextButton.isSelected = !text.isEmpty
        
    }
    
    func autoLayout() {
        navigationController?.navigationBar.isHidden = true
        view.addSubviews([floatingLabel, wsNameTextField, nextButton, closeButton, moveLabel, warningLabel])
        
        nextButton.layout.top().trailing(constant: -16)
        
        closeButton.layout
            .leading(constant: 16)
            .centerY(equalTo: nextButton.centerYAnchor)
        
        wsNameTextField.layout
            .trailing(constant: -16)
            .centerY(constant: -115)
        let defaultLeading = wsNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        defaultLeading.priority = UILayoutPriority(500)
        defaultLeading.isActive = true
        
        textFieldLeadingConst = wsNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        textFieldLeadingConst.priority = .defaultLow
        textFieldLeadingConst.isActive = true
        
        
        floatingLabel.centerYAnchor
            .constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30).isActive = true
        floatingLabel.layout
            .leading(equalTo: wsNameTextField.leadingAnchor)
        
        moveLabel.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
        
        moveLabelLeadingConst = moveLabel.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
        moveLabelLeadingConst.isActive = true
        
        warningLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor)
        let defaultCenterY = warningLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor)
        defaultCenterY.priority = UILayoutPriority(500)
        defaultCenterY.isActive = true
        
        warningLabelLeadingConst = warningLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor, constant: 30)
        warningLabelLeadingConst.priority = .defaultLow
        warningLabelLeadingConst.isActive = true
        
    }
}
