//
//  ViewController.swift
//  20193022_Tass
//
//  Created by hyeoktae kwon on 22/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result: Int = 0
    var toggle: Bool = true
    var toggle2: Bool = true
    
    
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        if toggle2 == true {
            toggle2 = false
            display.text = "뭐먹지?"
            subButton.setTitleColor(.gray, for: .disabled)
            addButton.setTitleColor(.gray, for: .disabled)
            subButton.isEnabled = false
            addButton.isEnabled = false
            
        }else {
            toggle2 = true
            display.text = String(result)
            subButton.isEnabled = true
            addButton.isEnabled = true
        }
        
    }
    
    
    @IBAction func labelSwitch(_ sender: UISwitch) {
        if toggle == true {
            display.isEnabled = false
            toggle = false
            result = 0
            display.text = "OFF"
        }else {
            display.isEnabled = true
            toggle = true
            display.text = "ON"
        }
        
    }
    
    
    @IBAction func subtractionButton(_ sender: UIButton) {
        
        if toggle == true{
        result -= 1
        display.text = String(result)
        display.textColor = .red
        }
    }
    
    @IBAction func additionButton(_ sender: UIButton) {
        
        if toggle == true{
        result += 1
        display.text = String(result)
        display.textColor = .blue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

