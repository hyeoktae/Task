//
//  SignUpView.swift
//  Omok
//
//  Created by hyeoktae kwon on 28/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import MobileCoreServices

// delegate for dismiss SignUpVC
protocol SignUpViewDelegate {
    func cancel()
    func imagePickerPresent()
    func trySignUp(ID: String, PW: String, nickName: String)
}

final class SignUpView: UIView {
    
    var delegate: SignUpViewDelegate?
    
    private let imagePickerController = UIImagePickerController()
    
    var imagePicker: UIImagePickerController {
        get {
            return imagePickerController
        }
    }
    
    private var imageState = false {
        willSet(state) {
            imageStateLabel.backgroundColor = state ? .blue : .red
        }
    }
    
    // MARK: - SignUpView's Property & Configure
    private let IDLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let IDTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let PWLabel: UILabel = {
        let label = UILabel()
        label.text = "PW"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let PWTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "nickName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nickNameTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let takeImage: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("takeImage", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapTakeImageBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let signUpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("SignUp", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSignUpBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let cancelBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("cancel", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapCancelBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let imageStateLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        imagePickerController.delegate = self
    }
    
    // MARK: - SignUpView's Button Actions
    @objc private func didTapSignUpBtn(_ sender: UIButton) {
        guard IDTF.text != "", PWTF.text != "", imageState else {
            print("ID or PW or Image are a nil")
            return
        }
        delegate?.trySignUp(ID: IDTF.text!, PW: PWTF.text!, nickName: nickNameTF.text!)
    }
    
    @objc private func didTapTakeImageBtn(_ sender: UIButton) {
        imagePickerController.sourceType = .photoLibrary
        delegate?.imagePickerPresent()
    }
    
    @objc private func didTapCancelBtn(_ sender: UIButton) {
        delegate?.cancel()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let guide = self.safeAreaLayoutGuide
        
        let properties = [IDLabel, IDTF, PWLabel, PWTF, takeImage, signUpBtn, imageStateLabel, cancelBtn, nickNameLabel, nickNameTF]
        
        properties.forEach { self.addSubview($0) }
        
        IDLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        IDLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        IDLabel.trailingAnchor.constraint(equalTo: IDTF.leadingAnchor, constant: -20).isActive = true
        
        IDTF.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        IDTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        IDTF.widthAnchor.constraint(equalTo: IDLabel.widthAnchor, multiplier: 3).isActive = true
        
        PWLabel.topAnchor.constraint(equalTo: IDLabel.bottomAnchor, constant: 20).isActive = true
        PWLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        PWLabel.trailingAnchor.constraint(equalTo: PWTF.leadingAnchor, constant: -20).isActive = true
        
        PWTF.topAnchor.constraint(equalTo: IDTF.bottomAnchor, constant: 20).isActive = true
        PWTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        PWTF.widthAnchor.constraint(equalTo: PWLabel.widthAnchor, multiplier: 3).isActive = true
        
        nickNameLabel.topAnchor.constraint(equalTo: PWLabel.bottomAnchor, constant: 20).isActive = true
        nickNameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        nickNameLabel.trailingAnchor.constraint(equalTo: nickNameTF.leadingAnchor, constant: -20).isActive = true
        
        nickNameTF.topAnchor.constraint(equalTo: PWLabel.bottomAnchor, constant: 20).isActive = true
        nickNameTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        nickNameTF.widthAnchor.constraint(equalTo: nickNameLabel.widthAnchor, multiplier: 3).isActive = true
        
        takeImage.topAnchor.constraint(equalTo: nickNameTF.bottomAnchor, constant: 20).isActive = true
        takeImage.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        imageStateLabel.topAnchor.constraint(equalTo: takeImage.topAnchor).isActive = true
        imageStateLabel.leadingAnchor.constraint(equalTo: takeImage.trailingAnchor, constant: 20).isActive = true
        imageStateLabel.heightAnchor.constraint(equalTo: takeImage.heightAnchor).isActive = true
        imageStateLabel.widthAnchor.constraint(equalTo: takeImage.heightAnchor).isActive = true
        
        signUpBtn.topAnchor.constraint(equalTo: takeImage.bottomAnchor, constant: 20).isActive = true
        signUpBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        cancelBtn.topAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 20).isActive = true
        cancelBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// choose UIImagePickerControllerDelegate
extension SignUpView: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let image = info[.originalImage] as! UIImage
            
            Users.shared.myLoginInfo.playerImg = image
            imageState.toggle()
        }
        picker.dismiss(animated: true)
    }
}

// must choose UINavigationControllerDelegate before use imagePickerController
extension SignUpView: UINavigationControllerDelegate {
    
}
