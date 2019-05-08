//
//  ViewController.swift
//  PinchGestureTest
//
//  Created by hyeoktae kwon on 08/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var gesture: UIPinchGestureRecognizer = {
        let g = UIPinchGestureRecognizer()
        g.addTarget(self, action: #selector(pinch(_:)))
        return g
    }()

    lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.image = UIImage(named: "EndGame")
//        i.clipsToBounds = true
        return i
    }()
    
    lazy var scroll: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addGestureRecognizer(gesture)
        scroll.addSubview(imageView)
        scroll.addGestureRecognizer(gesture)
        view.addSubview(scroll)
        autoLayout()
    }
    
    @objc func pinch(_ sender: UIPinchGestureRecognizer) {
        var scale: CGFloat {
            get{
                return sender.scale
            }
        }
        
        imageView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        scroll.contentSize.height *= imageView.transform.a
        scroll.contentSize.width *= imageView.transform.a
        scroll.setContentOffset(CGPoint(x: -100, y: -100), animated: true)
        print(scroll.contentScaleFactor)
    }

    func autoLayout() {
        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        
    }
}
