//
//  Musics.swift
//  TestRXAmalofire
//
//  Created by hyeoktae kwon on 2019/06/09.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let musics = try? newJSONDecoder().decode(Musics.self, from: jsonData)

import Foundation
import UIKit
import RxSwift
import RxAlamofire

// MARK: - Musics
struct Musics: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let artistName, trackName: String?
    let previewUrl: String?
    let artworkUrl100: String?
}

class Track {
    static let shared = Track()
    
    var musics: Musics? = nil
    var images: [UIImage?]? = []
}


final class Networking {
    static let shared = Networking()
    
    private func downloadList(_ text: String, completion: @escaping ([Result]) -> ()) {
        _ = requestData(.get, "https://itunes.apple.com/search?media=music&entity=song&term=fuck")
            .subscribe(onNext: { (res, data) in
                Track.shared.musics = try? JSONDecoder().decode(Musics.self, from: data)
                completion(Track.shared.musics!.results)
            })
    }
    
    func download(_ text: String, completion: @escaping () -> ()) {
        downloadList(text) {
            for urlString in $0 {
                let url = URL(string: urlString.artworkUrl100!)!
                let data = try? Data(contentsOf: url)
                Track.shared.images?.append(UIImage(data: data!)!)
                completion()
            }
        }
    }
}
