//
//  ViewController.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let sRVC = SliderResultVC()
    let notiCenter = NotificationCenter.default
    let tap = UITabBarController()
    let navi = UINavigationController(rootViewController: TextFieldVC())
    
    var sliderBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("과제", for: .normal)
        btn.tag = 1
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var TFBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("도전과제", for: .normal)
        btn.tag = 2
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let sVC = SliderVC()
        sVC.tabBarItem.title = "1"
        
        sRVC.tabBarItem.title = "2"
        
        tap.viewControllers = [sVC, sRVC]
        
        view.addSubview(sliderBtn)
        view.addSubview(TFBtn)
        autoLayout()
        addOvserver(vc: sRVC)
    }
    
    func addOvserver(vc: SliderResultVC) {
        notiCenter.addObserver(vc, selector: #selector(vc.changeColorNoti(_:)), name: Notification.Name("changeColorNoti")
            , object: nil)
    }
    
    
    
    @objc func next(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            present(tap, animated: true)
        case 2:
            present(navi, animated: true)
        default:
            break
        }
    }

    func autoLayout() {
        sliderBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        sliderBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        sliderBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        sliderBtn.bottomAnchor.constraint(equalTo: TFBtn.topAnchor, constant: -50).isActive = true
        
        TFBtn.topAnchor.constraint(equalTo: sliderBtn.bottomAnchor, constant: 50).isActive = true
        TFBtn.heightAnchor.constraint(equalTo: sliderBtn.heightAnchor).isActive = true
        TFBtn.widthAnchor.constraint(equalTo: sliderBtn.widthAnchor).isActive = true
        TFBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }

    deinit {
        notiCenter.removeObserver(self)
    }
}

