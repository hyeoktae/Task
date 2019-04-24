//
//  DataViewController.swift
//  TestPageBase
//
//  Created by hyeoktae kwon on 24/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }


}

