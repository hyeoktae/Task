//
//  DataModel.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UserInfo
protocol User {
    var ID: String { get set }
    var loginState: Bool { get set }
    var playerImg: UIImage? { get set }
    var vs: String { get set }
    var winCount: Int { get set }
    var loseCount: Int { get set }
    var nickName: String { get set }
}




// MARK: - Users Silgleton Pattern
final class Users {
    static let shared = Users()
    
    private init() {}
    
    private var users = [UserInfo]()
    private var usersName = [String]()
    private var myInfo = UserInfo(ID: "", loginState: false, playerImg: nil, vs: "", winCount: 0, loseCount: 0, nickName: "")
    
    var usersInfo: [UserInfo]  {
        get {
            return users
        }
        set {
            users = newValue
        }
    }
    
    var myLoginInfo: UserInfo {
        get {
            return myInfo
        }
        set {
            myInfo = newValue
        }
    }
    
    var names: [String] {
        get {
            return usersName
        }
        set {
            usersName = newValue
        }
    }
}


// MARK: - MyLoginInfo
struct UserInfo: User {
    var ID: String
    var loginState: Bool
    var playerImg: UIImage?
    var vs: String
    var winCount: Int
    var loseCount: Int
    var nickName: String
}

// MARK: - UIImage - String || String - UIImage
extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            return UIImage(data: data)
        }
        return nil
    }
}

extension UIImage {
    func toString() -> String? {
        return self.pngData()?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
