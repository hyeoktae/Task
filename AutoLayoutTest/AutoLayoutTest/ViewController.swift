//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by hyeoktae kwon on 09/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
     viewWillAppear -> viewWillLayoutSubviews -> viewDidLayoutSubviews -> viewDidAppear
     */
    @objc var view1 = UIView()
    @objc var view2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        creatView()
    }
    
    func creatView() {
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin
        
        view1.frame = CGRect(
            x: safeLayoutInsets.left + margin,
            y: yOffset,
            width: viewWidth,
            height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin)
        )
        
        view2.frame = CGRect(origin: CGPoint(x: view1.frame.maxX + padding, y: yOffset), size: view1.bounds.size)
        
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    
    
    
}

