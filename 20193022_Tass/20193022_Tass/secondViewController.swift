//
//  SecondViewController.swift
//  20193022_Tass
//
//  Created by hyeoktae kwon on 22/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var numberArray: Array<Int> = []
    var operatorCount: Int = 0
    var marks: String = ""
    var labelText: String = ""
    
    

    @IBAction func numbers(_ sender: UIButton) {
        
        func reduce() {
            firstNumber = sender.tag
            labelText = labelText + String(sender.tag)
            calculatorDisplay.text = labelText
        }
        
        switch sender.tag {
        case 0:
            reduce()
        case 1:
            reduce()
        case 2:
            reduce()
        case 3:
            reduce()
        case 4:
            reduce()
        case 5:
            reduce()
        case 6:
            reduce()
        case 7:
            reduce()
        case 8:
            reduce()
        case 9:
            reduce()
            
        default:
            break
        }
    }
    
    
    
    
    @IBAction func operators(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            for i in 0 ..< operatorCount{
                
            }
        case 1:
            operatorCount += 1
            numberArray.append(firstNumber)
        case 2:
            operatorCount += 1
            numberArray.append(firstNumber)
        case 3:
            operatorCount += 1
            numberArray.append(firstNumber)
        case 4:
            operatorCount += 1
            numberArray.append(firstNumber)
        case 5:
            firstNumber = 0
            labelText = "0"
            calculatorDisplay.text = labelText
        default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
