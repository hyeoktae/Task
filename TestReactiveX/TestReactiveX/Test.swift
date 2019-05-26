//
//  Test.swift
//  TestReactiveX
//
//  Created by hyeoktae kwon on 25/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import RxSwift

var test3 = 5
var test4 = 6

class Test01 {
    var oper01: Int
    init(_ num: Int) {
        self.oper01 = num
    }
}

struct Test02 {
    var oper02: Int
}

func checkArrayObservable(items: [Int]) -> Observable<Int> {
    return Observable<Int>.create { observer -> Disposable in
        
        for item in items {
            if item == 0 {
                observer.onError(NSError(domain: "ERROR: value is zero.", code: 0, userInfo: ["error":item]))
                break
            }
            
            observer.onNext(item)
            
            sleep(1)
        }
        
        observer.onCompleted()
        
        return Disposables.create()
    }
}


