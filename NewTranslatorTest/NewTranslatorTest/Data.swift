//
//  Data.swift
//  NewTranslatorTest
//
//  Created by hyeoktae kwon on 09/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

enum Language {
    static var kr: String {return "kr"}
    static var en: String {return "en"}
    static var jp: String {return "jp"}
}

func translate(text: String, src: String, target: String) -> String {
    
    var translatedText = String()
    
    let headers = [
        "Authorization": "KakaoAK 83b8387c1804d74abf5ccf2bd6c6dfa0",
        "User-Agent": "PostmanRuntime/7.11.0",
        "Accept": "*/*",
        "Cache-Control": "no-cache",
        "Postman-Token": "50a5b077-69a4-42e4-a0b6-0d2a46c70c54,7c9681f9-e4d9-4a7c-a5b3-5f2c7acfb0bc",
        "Host": "kapi.kakao.com",
        "accept-encoding": "gzip, deflate",
        "content-length": "",
        "Connection": "keep-alive",
        "cache-control": "no-cache"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://kapi.kakao.com/v1/translation/translate?query=\(text)&src_lang=\(src)&target_lang=\(target)")! as URL,
        cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
            translatedText = "error"
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            do{
            let result = try JSONDecoder().decode(Result.self, from: data!)
                
                translatedText = result.translatedText[0][0]
                print(translatedText)
            }catch(let error){
                print(error.localizedDescription)
                translatedText = "error"
            }
        }
    })
    
    dataTask.resume()
    return translatedText
}


struct Result: Codable {
    let translatedText: [[String]]
    
    enum CodingKeys: String, CodingKey {
        case translatedText = "translated_text"
    }
}
