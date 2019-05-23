//
//  ReadText.swift
//  N5mok
//
//  Created by hyeoktae kwon on 23/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

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

func postman(_ input: String, completion: @escaping (Data?)->()) {
    
    let text = input == "" ? "아무것도 없음, 입력바람" : input
    
    let headers = [
        "Authorization": "KakaoAK 275032a6a504340e76c9d95b1d723777",
        "Content-Type": "application/xml"
    ]
    
    let postData = NSData(data:
        """
            <speak>
            <voice>\(text)</voice>
            </speak>
            """
            .data(using: String.Encoding.utf8)!)
        
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
                completion(data)
            }
        })
        
        dataTask.resume()
    
}

func initializePlayer(text: String, vc: PopUpVC) {
    postman(text){data in
        do {
            try player = AVAudioPlayer(data: data!)
            player.play()
        } catch(let error as NSError) {
            print("플레이어 초기화 실패")
            print("code: \(error.code), message: \(error.localizedDescription)")
        }
    }
}

extension AVAudioPlayerDelegate {
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류")
            return
        }
        print(error.localizedDescription)
    }
}
