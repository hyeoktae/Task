//
//  ViewController.swift
//  TouchTest
//
//  Created by hyeoktae kwon on 04/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var startPoint: CGPoint?
    
    var methodStatus: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    var touchStatus: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    var tapStatus: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    var xPoint: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()
    var yPoint: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.borderWidth = 1
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(methodStatus)
        view.addSubview(touchStatus)
        view.addSubview(tapStatus)
        view.addSubview(xPoint)
        view.addSubview(yPoint)
        autoLayout()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        view.isMultipleTouchEnabled = true
        
        methodStatus.text = "touchesBegan"
        touchStatus.text = "\(touchCount) touches"
        tapStatus.text = "\(tapCount) taps"
        
        if let theTouch = touches.first {
            startPoint = theTouch.location(in: self.view)
            let x = startPoint!.x
            let y = startPoint!.y
            xPoint.text = String(format: "%.2f", x)
            yPoint.text = String(format: "%.2f", y)
        }
        
        
    }

    func autoLayout() {
        methodStatus.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        methodStatus.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        methodStatus.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        methodStatus.bottomAnchor.constraint(equalTo: touchStatus.topAnchor, constant: 50).isActive = true
        methodStatus.heightAnchor.constraint(equalTo: touchStatus.heightAnchor, multiplier: 1).isActive = true
        
        touchStatus.topAnchor.constraint(equalTo: methodStatus.bottomAnchor, constant: -50).isActive = true
        touchStatus.leadingAnchor.constraint(equalTo: methodStatus.leadingAnchor).isActive = true
        touchStatus.trailingAnchor.constraint(equalTo: methodStatus.trailingAnchor).isActive = true
        touchStatus.bottomAnchor.constraint(equalTo: tapStatus.topAnchor, constant: 50).isActive = true
        touchStatus.heightAnchor.constraint(equalTo: tapStatus.heightAnchor, multiplier: 1).isActive = true
        
        tapStatus.topAnchor.constraint(equalTo: touchStatus.bottomAnchor, constant: -50).isActive = true
        tapStatus.leadingAnchor.constraint(equalTo: touchStatus.leadingAnchor).isActive = true
        tapStatus.trailingAnchor.constraint(equalTo: touchStatus.trailingAnchor).isActive = true
        tapStatus.bottomAnchor.constraint(equalTo: xPoint.bottomAnchor, constant: -50).isActive = true
        tapStatus.heightAnchor.constraint(equalTo: xPoint.heightAnchor, multiplier: 1).isActive = true
        
        xPoint.topAnchor.constraint(equalTo: tapStatus.bottomAnchor, constant: -50)
        xPoint.leadingAnchor.constraint(equalTo: tapStatus.leadingAnchor, constant: 50).isActive = true
        xPoint.trailingAnchor.constraint(equalTo: yPoint.leadingAnchor, constant: -20).isActive = true
        xPoint.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        xPoint.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        yPoint.topAnchor.constraint(equalTo: xPoint.topAnchor).isActive = true
        yPoint.leadingAnchor.constraint(equalTo: xPoint.trailingAnchor, constant: 20).isActive = true
        yPoint.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        yPoint.bottomAnchor.constraint(equalTo: xPoint.bottomAnchor).isActive = true
        yPoint.heightAnchor.constraint(equalTo: xPoint.heightAnchor, multiplier: 1).isActive = true
    }
    
}

