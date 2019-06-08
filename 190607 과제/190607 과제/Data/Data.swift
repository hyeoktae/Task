//
//  Data.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.

import Foundation
import UIKit

struct track {
    let url: String?
    let name: String?
    let artist: String?
}

class Tracks {
    static let shared = Tracks()
    
    var tracks = [track]()
    var images = [UIImage]()
}


final class Networking {
    static let shared = Networking()
    
    private func downloadList(_ text: String, completion: @escaping ([track]) -> ()) {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(text)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let _ = response as? HTTPURLResponse else { fatalError("data empty") }
            
            guard let test = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let arr = test["results"] as? [Any]
                 else { fatalError("json error") }
            
            for idx in arr {
                guard let idx = idx as? [String: Any] else { return }
                let result = idx.filter{ $0.key == "trackName" || $0.key == "artistName" || $0.key == "artworkUrl100" }
                Tracks.shared.tracks.append(track(url: result["artworkUrl100"] as? String, name: result["trackName"] as? String, artist: result["artistName"] as? String))
            }
            
            completion(Tracks.shared.tracks)
        }.resume()
    }
    
    func download(_ text: String, completion: @escaping () -> ()) {
        downloadList(text) {
            
            for urlString in $0 {
                let url = URL(string: urlString.url!)!
                let data = try? Data(contentsOf: url)
                Tracks.shared.images.append(UIImage(data: data!)!)
            }
            completion()
        }
    }
    
}

