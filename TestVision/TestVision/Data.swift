//
//  Data.swift
//  TestVision
//
//  Created by hyeoktae kwon on 13/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

struct ErrorCode: Codable {
    let msg: String
    let code: Int
}


struct Effect: Codable {
    let result: Result
}

struct Result: Codable {
    let width, height: Int
    let faces: [Face]
}

struct Face: Codable {
    let facialAttributes: FacialAttributes
    let facialPoints: FacialPoints
    let score: Double
    let classIdx: Int
    let x, y, w, h: Double
    let pitch, yaw, roll: Double
    
    enum CodingKeys: String, CodingKey {
        case facialAttributes = "facial_attributes"
        case facialPoints = "facial_points"
        case score
        case classIdx = "class_idx"
        case x, y, w, h, pitch, yaw, roll
    }
}

struct FacialAttributes: Codable {
    let gender: Gender
    let age: Double
}

struct Gender: Codable {
    let male, female: Double
}

struct FacialPoints: Codable {
    let jaw, rightEyebrow, leftEyebrow, nose: [[Double]]
    let rightEye, leftEye, lip: [[Double]]
    
    enum CodingKeys: String, CodingKey {
        case jaw
        case rightEyebrow = "right_eyebrow"
        case leftEyebrow = "left_eyebrow"
        case nose
        case rightEye = "right_eye"
        case leftEye = "left_eye"
        case lip
    }
}
