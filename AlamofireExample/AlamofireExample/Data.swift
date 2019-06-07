//
//  Data.swift
//  AlamofireExample
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let musics = try? newJSONDecoder().decode(Musics.self, from: jsonData)

import Foundation

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
