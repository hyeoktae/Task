//
//  ViewController.swift
//  TestVision
//
//  Created by hyeoktae kwon on 13/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import MobileCoreServices

class BasicVC: UIViewController {
    
    private let imagePC = UIImagePickerController()
    
    var image = UIImage()
    
    var albumBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("앨범", for: .normal)
        btn.layer.borderWidth = 1
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(pickImage(_:)), for: .touchUpInside)
        return btn
    }()
    
    var photoBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("사진", for: .normal)
        btn.layer.borderWidth = 1
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(takePicture(_:)), for: .touchUpInside)
        return btn
    }()
    
    var resultBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("결과보기", for: .normal)
        btn.layer.borderWidth = 1
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(toResult), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
        imagePC.delegate = self
    }
    
    @objc func pickImage(_ sender: Any) {
        imagePC.sourceType = .photoLibrary
        present(imagePC, animated: true)
    }
    
    @objc func takePicture(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePC.sourceType = .camera
        imagePC.mediaTypes = [kUTTypeImage as String]
        present(imagePC, animated: true)
    }
    
    @objc func toResult() {
        let resultVC = ResultVC()
        resultVC.imageView.image = self.image
        present(resultVC, animated: true)
        print(self.image)
    }

    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(albumBtn)
        view.addSubview(photoBtn)
        view.addSubview(resultBtn)
        
        albumBtn.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        albumBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        albumBtn.trailingAnchor.constraint(equalTo: photoBtn.leadingAnchor, constant: -20).isActive = true
        albumBtn.widthAnchor.constraint(equalTo: photoBtn.widthAnchor, multiplier: 1).isActive = true
        
        photoBtn.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        photoBtn.leadingAnchor.constraint(equalTo: albumBtn.trailingAnchor, constant: 20).isActive = true
        photoBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        
        resultBtn.topAnchor.constraint(equalTo: albumBtn.bottomAnchor, constant: 40).isActive = true
        resultBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        resultBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50).isActive = true
        resultBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50).isActive = true
    }

}

extension BasicVC: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            
            self.image = info[.originalImage] as! UIImage
            print("delegate", self.image)
            
        }
        picker.dismiss(animated: true)
    }
}


extension BasicVC: UINavigationControllerDelegate {
    
}
