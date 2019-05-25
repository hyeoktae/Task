//
//  ViewController.swift
//  TestReactiveX
//
//  Created by hyeoktae kwon on 25/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkArrayObservable(items: [1,2,0,4,5])
            .subscribe(onNext: { (result) in
                print("결과는: ", result)
            }, onError: { (error) in
                print("error: ", error.localizedDescription)
            }, onCompleted: {
                print("error가 없으면 완료 되겠지?")
            }) {
                print("dispose 이게뭐징")
        }
        .dispose()
        
        
        checkArrayObservable(items: [1,2,0,4,5])
            .subscribe {
                switch $0 {
                case .next(let result):
                    print("결과는: \(result)")
                case .error(let error):
                    print("error: \(error.localizedDescription), \(error)")
                    let error1 = error as NSError
                    let result = error1.userInfo as? [String:Int]
                    print("error 원인: ", result!["error"])
                case .completed:
                    print("completed!!!")
                }
        }
        .dispose()
        
        
    }


}

