//
//  ViewController.swift
//  NewTranslatorTest
//
//  Created by hyeoktae kwon on 09/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var src: String = ""
    var target: String = ""
    
    @IBOutlet weak var srcText: UITextView!
    @IBOutlet weak var targetText: UITextView!
    @IBOutlet weak var srcSeg: UISegmentedControl!
    @IBOutlet weak var targetSeg: UISegmentedControl!
    
    
    @IBAction func segue(_ sender: UISegmentedControl) {
        switch sender.tag {
        case 1:
            switch sender.selectedSegmentIndex {
            case 0:
                src = Language.kr
            case 1:
                src = Language.en
                targetSeg.selectedSegmentIndex = 0
                target = Language.kr
            case 2:
                src = Language.jp
                targetSeg.selectedSegmentIndex = 0
                target = Language.kr
            default:
                break
            }
        case 2:
            switch sender.selectedSegmentIndex {
            case 0:
                target = Language.kr
            case 1:
                target = Language.en
            case 2:
                target = Language.jp
            default:
                break
            }
        default:
            break
        }
    }
    
    @IBAction func transBtn(_ sender: UIButton) {
        print("src: \(src), target: \(target), text: \(srcText.text)")
        
        let text = translate(text: srcText.text ?? "", src: src, target: target)
        
            targetText.text = text
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

