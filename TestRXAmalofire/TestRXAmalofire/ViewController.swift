//
//  ViewController.swift
//  TestRXAmalofire
//
//  Created by hyeoktae kwon on 2019/06/09.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import RxAlamofire
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        _ = request(.get, "https://itunes.apple.com/search?media=music&entity=song&term=fuck")
//            .validate(statusCode: 200..<300)
//            .responseJSON()
//            .observeOn(MainScheduler.instance)
//            .subscribe {
//                print($0)
//        }
//        _ = json(.get, "https://itunes.apple.com/search?media=music&entity=song&term=fuck")
//            .observeOn(MainScheduler.instance)
//            .subscribe {
//                print($0)
//        }
        
        
        _ = requestJSON(.get, "https://itunes.apple.com/search?media=music&entity=song&term=fuck")
            .subscribe(onNext: { (res, data) in
                guard let dict = data as? [String: Any] else {return}
                let test = dict["results"] as? [Any]
                print(test)
            }, onError: { (err) in
                print(err.localizedDescription)
            }, onCompleted: {
                print("completed")
            }) {
                print("disposed")
        }
        
    }


}

