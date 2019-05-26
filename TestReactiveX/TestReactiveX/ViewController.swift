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
    
    var test1 = Reactive(test4)
    
    var test2 = Reactive(test3)
    
    var test01 = Reactive(Test01.init(5))
    
    var test02 = Reactive(Test02.init(oper02: 9))
    
    let bag = DisposeBag()
    
    let test = Observable.from([1,2,3,4,5,0])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        DispatchQueue.global().async {
//        self.test.subscribe(onNext: { (data) in
//            data == 0 ? print("error") : print(data)
//            DispatchQueue.main.async {
//                sleep(3)
//            }
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("completed")
//        }) {
//            print("disposed")
//        }
//            .disposed(by: self.bag)
//        }
        
        
        
        
//        checkArrayObservable(items: [1,2,0,4,5])
//            .subscribe(onNext: { (result) in
//                print("결과는: ", result)
//            }, onError: { (error) in
//                print("error: ", error.localizedDescription)
//            }, onCompleted: {
//                print("error가 없으면 완료 되겠지?")
//            }) {
//                print("dispose 이게뭐징")
//        }
//        .disposed(by: self.disposeBag)
//
//
//        checkArrayObservable(items: [1,2,0,4,5])
//            .subscribe {
//                switch $0 {
//                case .next(let result):
//                    print("결과는: \(result)")
//                case .error(let error):
//                    print("error: \(error.localizedDescription), \(error)")
//                    let error1 = error as NSError
//                    let result = error1.userInfo as? [String:Int]
//                    print("error 원인: ", result!["error"])
//                case .completed:
//                    print("completed!!!")
//                }
//        }
//        .disposed(by: self.disposeBag)
        
        
    }

    deinit {
        
    }

}

