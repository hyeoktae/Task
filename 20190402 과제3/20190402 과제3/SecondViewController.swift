//
//  SecondViewController.swift
//  20190402 과제3
//
//  Created by hyeoktae kwon on 03/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var text = ""
    
    @IBOutlet weak var segueController: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let dest = segue.destination as? FirstViewController, let labelText = segueController.titleForSegment(at: segueController.selectedSegmentIndex) else {
            return
        }
        dest.firstLabelText = labelText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(text)
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
