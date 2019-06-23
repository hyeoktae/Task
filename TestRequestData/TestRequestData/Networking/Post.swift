//
//  Post.swift
//  TestRequestData
//
//  Created by hyeoktae kwon on 2019/06/23.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    
    func kakaoAPI(_ text: String, completion: @escaping (Data) -> ()) {
        let url = URL(string: "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize")!
        
        let headers = [
            "Authorization": "KakaoAK 51ee73d3f90160581db5903f59b35e88",
            "Content-Type": "application/xml"
        ]
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let xmlFile = """
            <speak>
            <voice name="WOMAN_DIALOG_BRIGHT">\(text)</voice>
            </speak>
            """.data(using: .utf8)
        
        request.httpBody = xmlFile
        print("before")
        
        let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
            print(err?.localizedDescription)
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
}

