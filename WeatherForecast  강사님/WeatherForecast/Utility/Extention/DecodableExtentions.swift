//
//  DecodableExtentions.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

extension Decodable {
    static func decode(
        from data: Data,
        decoder: JSONDecoder = JSONDecoder()
        ) throws -> Self {
        return try decoder.decode(self, from: data)
    }
}

extension Data {
    func decode<T>(
        to target: T.Type,
        decoder: JSONDecoder = JSONDecoder()
        ) throws -> T where T: Decodable {
        return try decoder.decode(target, from: self)
    }
}

