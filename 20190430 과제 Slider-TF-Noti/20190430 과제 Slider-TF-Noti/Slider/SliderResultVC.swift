//
//  SliderResultVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let changeColorNoti = Notification.Name("changeColorNoti")
}

class SliderResultVC: UIViewController {
    
    let notiCenter = NotificationCenter.default
    
    lazy var colorV: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(colorV)
        autoLayout()
    }
    @objc func changeColorNoti(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String:UIColor] else {
            return
        }
        colorV.backgroundColor = userInfo["color"]!
    }
    
    func autoLayout() {
        colorV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        colorV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        colorV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        colorV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
