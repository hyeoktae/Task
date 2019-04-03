//
//  ViewController.swift
//  20190402 과제3
//
//  Created by hyeoktae kwon on 03/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    
    var firstLabelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        firstLabel.text = firstLabelText
    }
    
    
}

