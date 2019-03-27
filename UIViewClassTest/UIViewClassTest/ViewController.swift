//
//  ViewController.swift
//  UIViewClassTest
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vayne: SampleView = SampleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func createVayne() {
        vayne.frame = CGRect(x: 20, y: 50, width: 200, height: 300)
        vayne.champButton.backgroundImage(for: .normal) = #imageLiteral(resourceName: <#T##String#>)
    }
    

}

