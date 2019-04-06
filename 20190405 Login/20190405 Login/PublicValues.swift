//
//  PublicValues.swift
//  20190405 Login
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

let userDefaults = UserDefaults.standard

public class SaveUsers {
    static let saveUsers = SaveUsers()
    private init () {}
    func saveUsers(ID: String, PW: String) {
        userDefaults.set(PW, forKey: ID)
    }
}

public class FindUsers {
    static let findUsers = FindUsers()
    private init () {}
    func findUsers(ID: String) -> String{
        guard let ID = userDefaults.object(forKey: ID) as? String else {
            print("아이디가 없다~")
            return "can't found ID"
        }
        return ID
    }
}

public class OnLoginState {
    static let onLoginState = OnLoginState()
    private init () {}
    func onLoginState(ID: String) {
        UserDefaults.standard.set(true, forKey: "LoginState")
        UserDefaults.standard.set(ID, forKey: "LoginID")
    }
}

public class OffLoginState {
    static let offLoginState = OffLoginState()
    private init () {}
    func offLoginState() {
        UserDefaults.standard.set(false, forKey: "LoginState")
    }
}

public class CheckLoginState {
    static let checkLoginState = CheckLoginState()
    private init () {}
    func checkLoginState() -> Bool{
        return UserDefaults.standard.bool(forKey: "LoginState")
    }
}


public class Padding {
    static let padding = Padding()
    private init() {}
    let padding: CGFloat = 20
}

//public class inputID {
//    static let ID = inputID()
//    private init () {}
//    var ID: String = ""
//}
//
//public class inputPW {
//    static let PW = inputPW()
//    private init () {}
//    var PW: String = ""
//}
