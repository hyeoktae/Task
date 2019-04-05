//
//  ViewController.swift
//  EasyDelegate
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class 일터: UIViewController {
    
    @IBOutlet weak var 삽: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func 일급받기(_ sender: UIButton) {
        performSegue(withIdentifier: "삽질끝", sender: self)
    }
    
    let 노동자1 = 노동자()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        guard let 회사 = segue.destination as? 노가다회사 else {
            return
        }
        노동자1.something = 삽.text ?? ""
        회사.채용공고 = 노동자1
    }
    
}

//
//extension 일터: 노가다회사Delegate {
//    func 삽질잘하는() -> String {
//        guard let 삽질 = 삽.text else {
//            return "일안했냐?"
//        }
//        return 삽질
//    }
//
//    @IBAction func unwindTo일터(_ unwindSegue: UIStoryboardSegue) {
//        삽.text = nil
//    }
//
//}
