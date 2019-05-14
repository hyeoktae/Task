//
//  ViewController.swift
//  TestAnimation
//
//  Created by hyeoktae kwon on 14/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Time {
        static let short = 0.3
        static let middle = 0.65
        static let long = 1.0
        
    }
    
    private struct UI {
        static let menuCount = 5
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.3
    }
    
    private var firstMenuContainer: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
        
    }
    
    private func randomColorGenerator() -> UIColor{
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    private func makeMenuButtonWith(title: String, frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle("버튼 \(title)", for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    
    private func setupFirstMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(title: "\(i)", frame: menuFrame)
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstmenuDidTap(_:)), for: .touchUpInside)
            }
            view.bringSubviewToFront(firstMenuContainer.first!)
        }
        
    }
    
    @objc func firstmenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        UIView.animate(
            withDuration: Time.middle,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0, // 초기가속도
            options: [],
            animations: {
                for (idx, menu) in self.firstMenuContainer.enumerated() {
                    guard idx != 0 else { return }
                    if sender.isSelected {
                        menu.transform = .identity
                        menu.frame.origin.y -= UI.distance * CGFloat(idx)
                    } else {
                        menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                        menu.center.y += UI.distance * CGFloat(idx)
                    }
                }
        })
    }
    
}

