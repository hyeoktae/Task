//
//  ViewController.swift
//  TestAnimation
//
//  Created by hyeoktae kwon on 14/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
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
    private var secondMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
        setupSecondMenu()
    }
    
    private func randomColorGenerator() -> UIColor{
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    
    private func setupSecondMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: view.frame.width - 50 - UI.menuSize, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            secondMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(secondMenuDidTap(_:)), for: .touchUpInside)
                
            }
            view.bringSubviewToFront(secondMenuContainer.first!)
        }
    }
    
    private func setupFirstMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
                
            }
            view.bringSubviewToFront(firstMenuContainer.first!)
        }
    }
    
    @objc func secondMenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        print(sender.isSelected)
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.beginFromCurrentState], animations: {
            var upArr = [UIButton]()
            var downArr = [UIButton]()
            var time = 0.0
            upArr = self.secondMenuContainer.filter { $0 != self.secondMenuContainer.first! }
            
            for _ in 1..<self.secondMenuContainer.count {
                UIView.addKeyframe(withRelativeStartTime: time, relativeDuration: 0.25, animations: {
                    if sender.isSelected {
                        upArr.first!.transform = .identity
                        upArr.forEach { $0.center.y -= UI.distance }
                        upArr = upArr.filter { $0 != upArr.first! }
                    } else {
                        upArr.last!.transform = upArr.last!.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                        downArr.append(upArr.last!)
                        downArr.forEach { $0.center.y += UI.distance }
                        upArr = upArr.filter { $0 != upArr.last! }
                    }
                })
                time += 0.25
            }
        })
    }
    
    @objc func firstMenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        print(sender.isSelected)
        UIView.animate(
            withDuration: Time.long,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0, // 초기가속도
            options: [],
            animations: {
                for (idx, menu) in self.firstMenuContainer.enumerated() {
                    guard idx != 0 else { continue }
                    if sender.isSelected {
                        menu.transform = .identity
                        menu.center.y -= UI.distance * CGFloat(idx)
                        print("true run")
                    } else {
                        menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                        menu.center.y += UI.distance * CGFloat(idx)
                        print("false run")
                    }
                }
        })
    }
    
}

