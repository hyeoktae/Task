//
//  ViewController.swift
//  TestRxLowVersion
//
//  Created by hyeoktae kwon on 2019/06/08.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import RxSwift
import RxTest
import RxBlocking
import RxCocoa
import RxAlamofire

class ViewController: UIViewController {
    
    
    var rx = Reactive<ViewController>(ViewController())
    
    var text: String = "fuck"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        _ = request(.get, "https://itunes.apple.com/search?media=music&entity=song&term=fuck")
            .validate(statusCode: 200..<300)
            .responseJSON()
            .observeOn(MainScheduler.instance)
            .subscribe({
                print($0)
            })
    }
    
}




