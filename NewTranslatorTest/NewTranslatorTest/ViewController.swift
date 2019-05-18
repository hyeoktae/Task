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
        srcText.resignFirstResponder()
        targetText.resignFirstResponder()
        switch sender.tag {
        case 1:
            switch sender.selectedSegmentIndex {
            case 0:
                src = Language.kr
                targetSeg.setEnabled(false, forSegmentAt: 0)
                targetSeg.setEnabled(true, forSegmentAt: 1)
                targetSeg.setEnabled(true, forSegmentAt: 2)
            case 1:
                src = Language.en
                targetSeg.setEnabled(true, forSegmentAt: 0)
                targetSeg.setEnabled(false, forSegmentAt: 1)
                targetSeg.setEnabled(false, forSegmentAt: 2)
            case 2:
                src = Language.jp
                targetSeg.setEnabled(true, forSegmentAt: 0)
                targetSeg.setEnabled(false, forSegmentAt: 1)
                targetSeg.setEnabled(false, forSegmentAt: 2)
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
        srcText.resignFirstResponder()
        targetText.resignFirstResponder()
        guard src != "", target != "" else {
            targetText.text = "세그먼트 체크"
            return
        }
        targetText.text = translate(text: srcText.text ?? "", src: src, target: target)
        src = ""
        target = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("안녕하세요 반가워요".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
    
}


