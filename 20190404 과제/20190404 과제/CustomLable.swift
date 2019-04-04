//
//  CustomLable.swift
//  20190404 과제
//
//  Created by hyeoktae kwon on 04/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol CustomLabelDelegate: class {
    func workHasan(_ text: String?) -> String?
}

class CustomLable: UILabel {

    weak var delegate: CustomLabelDelegate?
    
    override var text: String? {
        get{
            return super.text
        }
        set{
            print("in set: ", newValue)
            let text = delegate?.workHasan(newValue)
            let newText = text ?? "nil"
            super.text = newText
        }
    }

}
