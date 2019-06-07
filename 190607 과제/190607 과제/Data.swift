//
//  Data.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.

import Foundation
import UIKit

// MARK: - Musics
struct Musics: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType
    let kind: Kind?
    let artistID, collectionID: Int
    let trackID: Int?
    let artistName, collectionName: String
    let trackName: String?
    let collectionCensoredName: String
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL: String
    let trackViewURL: String?
    let previewURL: String
    let artworkUrl30: String?
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let trackPrice: Double?
    let releaseDate: Date
    let collectionExplicitness: Explicitness
    let trackExplicitness: Explicitness?
    let discCount, discNumber: Int?
    let trackCount: Int
    let trackNumber, trackTimeMillis: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let contentAdvisoryRating: ContentAdvisoryRating?
    let isStreamable: Bool?
    let resultDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, isStreamable
        case resultDescription = "description"
    }
}

enum Explicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum ContentAdvisoryRating: String, Codable {
    case clean = "Clean"
    case explicit = "Explicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case song = "song"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}


final class Networking {
    static let shared = Networking()
    
    var searchImgUrls = [String]()
    
    var images = [UIImage]()
    
    private func downloadList(_ text: String, completion: @escaping (Musics) -> ()) {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(text)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let res = response as? HTTPURLResponse else { fatalError("data empty") }
            print(res)
//            let resultData = try? JSONDecoder().decode(Musics.self
//                , from: data)
            let test = try? JSONSerialization.isValidJSONObject(data)
            print(test)
            let encodedData = data.base64EncodedString()
//            let decodedData = try? JSONDecoder().decode(Musics.self, from: encodedData)
//            print("result Count: ", decodedData?.resultCount)
            
//            completion(decodedData!)
        }.resume()
    }
    
    func download(_ text: String, completion: @escaping (Bool) -> ()) {
        
        downloadList(text) {
            self.searchImgUrls.append(contentsOf: $0.results.compactMap {$0.previewURL})
            
            
            for urlString in self.searchImgUrls {
                let url = URL(string: urlString)!
                let data = try? Data(contentsOf: url)
                self.images.append(UIImage(data: data!)!)
            }
            completion(true)
        }
    }
    
}

