//
//  ContentView.swift
//  AlamofireExample
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import SwiftUI
import Alamofire
import RxSwift
import RxCocoa



struct ContentView : View {
    
    
    
    let number: Int = 0
    
    let task = URLRequest(url: URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=ha")!)
    
    func test() {
        
    }
    
    var body: some View {
        Button(action: {
            let urlStr = "https://jsonplaceholder.typicode.com/todos"
            let req = AF.request(urlStr)
            req.validate()
                .responseJSON { (res) in
                    switch res.result {
                    case .success(let value):
                        print(value)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
            }
        }) {
            Text("BTN")
        }
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension Reactive where Base: URLSession {
    public func test(request: URLRequest) -> Observable<(Data, HTTPURLResponse)> {
        return Observable.create { (observer) in
            let task = self.base.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else {
                    observer.on(.error(error ?? RxCocoaError.unknown))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.on(.error(RxCocoaURLError.nonHTTPResponse(response: response)))
                    return
                }
                
                observer.onNext((data, httpResponse))
                observer.onCompleted()
            }.resume()
            
            return Disposables.create()
        }
        
    }
}
