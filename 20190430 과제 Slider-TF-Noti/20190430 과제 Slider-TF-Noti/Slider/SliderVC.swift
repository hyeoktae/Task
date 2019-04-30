//
//  SliderVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SliderVC: UIViewController {
    
    lazy var back: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("back", for: .normal)
        b.titleLabel?.font = b.titleLabel?.font.withSize(50)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        return b
    }()
    var red = CGFloat()
    var green = CGFloat()
    var blue = CGFloat()
    var alpha = CGFloat()
    
    let rView: SliderV = {
        let tv = SliderV(frame: .zero, text: "R", tag: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.slider.addTarget(self, action: #selector(change(_:)), for: .valueChanged)
        return tv
    }()
    let gView: SliderV = {
        let tv = SliderV(frame: .zero, text: "G", tag: 2)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.slider.addTarget(self, action: #selector(change(_:)), for: .valueChanged)
        return tv
    }()
    let bView: SliderV = {
        let tv = SliderV(frame: .zero, text: "B", tag: 3)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.slider.addTarget(self, action: #selector(change(_:)), for: .valueChanged)
        return tv
    }()
    let aView: SliderV = {
        let tv = SliderV(frame: .zero, text: "A", tag: 4)
        tv.slider.addTarget(self, action: #selector(change(_:)), for: .valueChanged)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    let btn: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("click", for: .normal)
        b.titleLabel?.font = b.titleLabel?.font.withSize(50)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return b
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rView)
        view.addSubview(bView)
        view.addSubview(gView)
        view.addSubview(aView)
        view.addSubview(btn)
        view.addSubview(back)
        autoLayout()
        view.backgroundColor = .white
    }
    
    @objc func goToBack() {
        presentingViewController?.dismiss(animated: true)
    }
    
    @objc func change(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            red = CGFloat(sender.value)
        case 2:
            green = CGFloat(sender.value)
        case 3:
            blue = CGFloat(sender.value)
        case 4:
            alpha = CGFloat(sender.value)
        default:
            break
        }
        
    }
    
    @objc func changeColor(_ sender: Any) {
        let color: UIColor = .init(red: red, green: green, blue: blue, alpha: alpha)
        NotificationCenter.default.post(name: Notification.Name("changeColorNoti"), object: sender, userInfo: ["color" : color])
    }
    
    func autoLayout() {
        rView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        rView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        rView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        rView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        rView.bottomAnchor.constraint(equalTo: gView.topAnchor, constant: -20).isActive = true
        
        gView.topAnchor.constraint(equalTo: rView.bottomAnchor, constant: 20).isActive = true
        gView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        gView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        gView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        gView.bottomAnchor.constraint(equalTo: bView.topAnchor, constant: -20).isActive = true
        
        bView.topAnchor.constraint(equalTo: gView.bottomAnchor, constant: 20).isActive = true
        bView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        bView.bottomAnchor.constraint(equalTo: aView.topAnchor, constant: -20).isActive = true
        
        aView.topAnchor.constraint(equalTo: bView.bottomAnchor, constant: 20).isActive = true
        aView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        aView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        aView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        aView.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -40).isActive = true
        
        btn.topAnchor.constraint(equalTo: aView.bottomAnchor, constant: 40).isActive = true
        btn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        btn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        btn.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        btn.bottomAnchor.constraint(equalTo: back.topAnchor, constant: -20).isActive = true
        
        back.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 20).isActive = true
        back.leadingAnchor.constraint(equalTo: btn.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: btn.trailingAnchor).isActive = true
        back.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
    }

}
