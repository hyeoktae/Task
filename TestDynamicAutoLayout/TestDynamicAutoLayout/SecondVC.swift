//
//  SecondVC.swift
//  TestDynamicAutoLayout
//
//  Created by hyeoktae kwon on 16/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    private let wsNameTextField: UITextField = {
        let textField = UITextField()
        let attrString = NSAttributedString( // 어떤속성을 문자열에 적용
            string: "Name your workspace",
            attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
        )
        textField.attributedPlaceholder = attrString
        textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
        textField.enablesReturnKeyAutomatically = true // 키보드 리턴키 동작안하게
        textField.borderStyle = .none
        textField.returnKeyType = .go // 키보드의 return을 go로 바꿈
        textField.autocorrectionType = .no // 자동완성 없앰
        textField.autocapitalizationType = .none // 첫문자 대문자로 하는거 없앰
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeImage = UIImage(named: "btnClose")!
        button.setImage(closeImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(nextButton)
        view.addSubview(closeButton)
        view.addSubview(wsNameTextField)
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        wsNameTextField.delegate = self
        
    }
    
    private func setupConstraints() {
        nextButton.layout.top().trailing(constant: -16)
        
        closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
    }
    
    @objc func didTapNextButton(_ sender: UIButton) {
        
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        
    }

}

extension SecondVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let replaceText = (text as NSString).replacingCharacters(in: range, with: string)
        nextButton.isSelected = !replaceText.isEmpty
        return true
    }
}
