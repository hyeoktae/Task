//
//  Test.swift
//  TestReactiveX
//
//  Created by hyeoktae kwon on 25/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import RxSwift


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


