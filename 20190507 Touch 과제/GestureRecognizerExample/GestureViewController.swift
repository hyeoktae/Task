//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
    
    var isQuadruple = false
    @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        if !isQuadruple {
        imageView.transform = imageView.transform.scaledBy(x: 1.5, y: 1.5)
        } else {
        imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
    }
    
    @IBAction func handelRotaionGesture(_ sender: UIRotationGestureRecognizer) {
        let rotaion = sender.rotation
        imageView.transform = imageView.transform.rotated(by: rotaion)
        sender.rotation = 0
        
//        imageView.transform = CGAffineTransform.identity.rotated(by: rotaion)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            imageView.image = UIImage(named: "cat1")
        case .right:
            imageView.image = UIImage(named: "cat2")
        default:
            ()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
  }
}
