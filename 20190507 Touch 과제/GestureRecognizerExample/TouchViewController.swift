//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
    
    var temp1 = CGFloat()
    var temp2 = CGFloat()
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width/2
        // 자신의 영역을 벗어나는건 잘라냄
        //    imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        let touchPoint = touch.location(in: touch.view)
        temp1 = imageView.frame.origin.x - touchPoint.x
        
        temp2 = imageView.frame.origin.y - touchPoint.y
        
        if imageView.frame.contains(touchPoint) {
        imageView.image = UIImage(named: "cat2")
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        let touchPoint = touch.location(in: touch.view)
        
        if imageView.frame.contains(touchPoint) {
            imageView.frame.origin = CGPoint(x: touchPoint.x + temp1, y: touchPoint.y + temp2)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        let touchPoint = touch.location(in: touch.view)
        
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat1")
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        let touchPoint = touch.location(in: touch.view)
    }
    
}



