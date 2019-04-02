//
//  SecondViewController.swift
//  StoryBoardSW
//
//  Created by hyeoktae kwon on 02/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
     var count: Int = 0
    var minus = 0
    
    @IBOutlet private weak var secondTF: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        count = firstVC.count
        print("B: \(count)")
        countLabel.text = "\(count)"
    }
    
    
    
    @IBAction func ddd(_ sender: UITextField) {
        guard let number = Int(sender.text ?? "0") else {return}
        minus = number
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        print("\n----------- [ prepare ] ---------")
        print(segue.destination)
        guard let dest = segue.destination as? SecondViewController else { return }
        dest.count = count
        count += 1
    }
    
    
    
    
    
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
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
