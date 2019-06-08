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

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let musics = try? newJSONDecoder().decode(Musics.self, from: jsonData)


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
