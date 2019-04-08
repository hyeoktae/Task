//
//  노가다회사.swift
//  EasyDelegate
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol 노가다회사Delegate: class {
    func 삽질잘하는()->String
}

class 노가다회사: UIViewController {
    
    weak var 채용공고: 노가다회사Delegate?
    
    @IBOutlet weak var 일급액수: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        일급액수계산()
    }
    
    func 일급액수계산() {
        일급액수.text = 채용공고?.삽질잘하는() // 일을 시키는
    }
    
    
    
}
