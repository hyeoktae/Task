//
//  Post.swift
//  TestTextReader
//
//  Created by hyeoktae kwon on 15/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import AVFoundation

enum voiceKind {
    static var woman1: String {return "WOMAN_READ_CALM"}
    static var woman2: String {return "WOMAN_DIALOG_BRIGHT"}
    static var man1: String {return "MAN_READ_CALM"}
    static var man2: String {return "MAN_DIALOG_BRIGHT"}
}

enum voiceSpeed {
    static var standard: String {return "SS_READ_SPEECH"}
    static var fast: String {return "SS_ALT_FAST_1"}
    static var slow: String {return "SS_ALT_SLOW_1"}
}

func request(text: String) -> Data? {
    
    var resultData: Data? = nil
    
    let group = DispatchGroup.init()
    
    let queue = DispatchQueue.global()
    
    let headers = [
        "Authorization": "KakaoAK 83b8387c1804d74abf5ccf2bd6c6dfa0",
        "Content-Type": "application/xml"
    ]
    
    let postData = NSData(data: "<speak><voice>\(text)</voice></speak>".data(using: String.Encoding.utf8)!)
    
    let url: URL = URL(string: "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize")!
    
    group.enter()
    queue.async {
        
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error)  in
            print("\n----- [ response ] -----\n")
            if (error != nil) {
                return print(error!.localizedDescription)
            } else {
                
                guard let data = data, let httpResponse = response as? HTTPURLResponse else { return }
                print(httpResponse)
                print(data)
                resultData = data
                
                
                group.leave()
            }
        })
        dataTask.resume()
    }
    print(group.wait(timeout: .distantFuture))
    return resultData
}

