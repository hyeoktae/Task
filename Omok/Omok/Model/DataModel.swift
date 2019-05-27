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
    var name: String { get set }
    var loginState: Bool { get set }
    var playerImg: UIImage? { get set }
    var vs: String { get set }
    var winCount: Int { get set }
    var loseCount: Int { get set }
}




// MARK: - Users Silgleton Pattern
class Users {
    static let shared = Users()
    
    private init() {}
    
    private var users = [UserInfo]()
    private var usersName = [String]()
    private var MyLoginInfo = UserInfo?()
    
    var takeUsersInfo: [UserInfo]  {
        get {
            return users
        }
    }
    
    var takeMyInfo: UserInfo {
        get {
            return MyLoginInfo
        }
    }
    
    var takeUsersName: [String] {
        get {
            return usersName
        }
    }
    
    var saveUsers: UserInfo {
        get {
            return MyLoginInfo
        }
        set {
            users.append(newValue)
        }
    }
    
    var saveMyInfo: UserInfo {
        get {
            return MyLoginInfo
        }
        set {
            MyLoginInfo = newValue
        }
    }
    
    
    
}


// MARK: - MyLoginInfo
struct UserInfo: User {
    var name: String
    var loginState: Bool
    var playerImg: UIImage?
    var vs: String
    var winCount: Int
    var loseCount: Int
    
    init() {
        self.name = ""
        self.loginState = false
        self.playerImg = nil
        self.vs = ""
        self.winCount = 0
        self.loseCount = 0
    }
}


