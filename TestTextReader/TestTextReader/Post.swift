//
//  Post.swift
//  TestTextReader
//
//  Created by hyeoktae kwon on 15/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import AVFoundation

//struct speak: Codable {
//    var voice: String
//}

//func xmlWrite() {
//    let url: URL = URL(string: "TestTextReader/speak.plist")!
//    let data = speak(voice: "안녕하세요 반가워요")
//    let encoder = PropertyListEncoder()
//    encoder.outputFormat = .xml
//
//    do {
//        let xmlData = try encoder.encode(data)
//        try xmlData.write(to: url)
//    } catch(let error) {
//        print(error.localizedDescription)
//    }
//}

func postman(_ input: String) -> Data? {
    
    let text = input == "" ? "아무것도 없음, 입력바람" : input
    
    var resultData: Data?
    
    let group = DispatchGroup.init()
    
    let queue = DispatchQueue.global()
    
    let headers = [
        "Authorization": "KakaoAK 51ee73d3f90160581db5903f59b35e88",
        "Content-Type": "application/xml",
        "User-Agent": "PostmanRuntime/7.13.0",
        "Accept": "*/*",
        "Cache-Control": "no-cache",
        "Postman-Token": "d693d920-38be-448b-98e5-2d5183f5200d,3687a5b7-4dbe-426d-a044-1d42f5df6397",
        "Host": "kakaoi-newtone-openapi.kakao.com",
        "accept-encoding": "gzip, deflate",
        "content-length": "60",
        "Connection": "keep-alive",
        "cache-control": "no-cache"
    ]
    
    let postData = NSData(data:
        """
<speak>
<voice>\(text)</voice>
</speak>
"""
        .data(using: String.Encoding.utf8)!)
    
    group.enter()
    queue.async {
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error!)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
            resultData = data
            group.leave()
        }
    })
    
        dataTask.resume() }
    print(group.wait(timeout: .distantFuture))
    return resultData
    
}

struct ErrorCode: Codable {
    let code: Int
    let description: String
}

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
        "Authorization": "KakaoAK 51ee73d3f90160581db5903f59b35e88",
        "Content-Type": "application/xml",
        "User-Agent": "PostmanRuntime/7.13.0",
        "Accept": "*/*",
        "Cache-Control": "no-cache",
        "Postman-Token": "d693d920-38be-448b-98e5-2d5183f5200d,3687a5b7-4dbe-426d-a044-1d42f5df6397",
        "Host": "kakaoi-newtone-openapi.kakao.com",
        "accept-encoding": "gzip, deflate",
        "content-length": "60",
        "Connection": "keep-alive",
        "cache-control": "no-cache"
    ]
    
    
//    let xmlData = NSData(data: "<?xml version=1.0 encoding=UTF-8?><speak><voice>아 언제 완성하지?</voice></speak>".data(using: .utf8, allowLossyConversion: true)!)
    
    
    
    let postData = NSData(data:
"""
<speak>
<voice>그는 그렇게 말했습니다.</voice>
<voice name=MAN_DIALOG_BRIGHT>잘 지냈어? 나도 잘 지냈어.</voice>
<voice name=WOMAN_DIALOG_BRIGH speechStyle=SS_ALT_FAST_1>금요일이 좋아요.</voice>
</speak>
""".data(using: String.Encoding.utf8)!)
    
//    xmlWrite()
    
    let url: URL = URL(string: "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize")!
    
    group.enter()
    queue.async {
//        guard let xmlURL = Bundle.main.url(forResource: "speak", withExtension: "plist") else {
//            print("No File")
//            return
//        }
        
//        print(xmlURL)
        
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
                do{
                let errorCode = try JSONDecoder().decode(ErrorCode.self, from: data)
                print(errorCode.description, errorCode.code)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                group.leave()
            }
        })
        dataTask.resume()
    }
    print(group.wait(timeout: .distantFuture))
    return resultData
}

