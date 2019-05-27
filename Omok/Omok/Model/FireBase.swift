//
//  FireBase.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Firebase





// MARK: - Networking Properties
final class Networking {
    
    static let shared = Networking()
    
    private init() {}
    
    // MARK: - FireBase Database Refernece
    private let dbRef = Database.database().reference()
    
    // MARK: - Users Singleton
    private let dataModel = Users.shared
    
    // MARK: - Download Users Info from DB
    func downloadUsers(completion: @escaping (Bool) -> () ) {
        // register Observer at Users
        dbRef.child("Users").observe(.value, with: {
            // when observer worked, do this closure
            var sampleUserInfo = [UserInfo]()
            let value = $0.value as? [String: Any]
            self.dataModel.names = value?.keys.sorted() ?? []
            
            for user in self.dataModel.names {
                let data = value?[user]
                let detailData = data as? [String:Any]
                let state = detailData?["loginState"] as? Bool
                let img = (detailData?["playerImg"] as? String)?.toImage()
                let enemy = detailData?["vs"] as? String
                let winCount = detailData?["winCount"] as? Int
                let loseCount = detailData?["loseCount"] as? Int
                
                sampleUserInfo.append(UserInfo(name: user, loginState: state ?? false, playerImg: img, vs: enemy ?? "", winCount: winCount ?? 0, loseCount: loseCount ?? 0))
            }
            self.dataModel.usersInfo = sampleUserInfo
            // when success
            completion(true)
        }) {
            // when fail
            completion(false)
            print($0.localizedDescription)
        }
    }
    
    // New User's Info Upload to DB, must run before SignUp
    func uploadNewUser(pw: String, completion: @escaping () -> () ) {
        let userImage = dataModel.myLoginInfo.playerImg?.toString()
        let userName = dataModel.myLoginInfo.name
        
        dbRef.child("Users").child(userName).updateChildValues(["playerImg":userImage ?? ""])
        dbRef.child("Users").child(userName).updateChildValues(["turn":false])
        dbRef.child("Users").child(userName).updateChildValues(["vs":""])
        dbRef.child("Users").child(userName).updateChildValues(["loginState":true])
        dbRef.child("Users").child(userName).updateChildValues(["winCount":0])
        dbRef.child("Users").child(userName).updateChildValues(["loseCount":0])
        dbRef.child("Users").child(userName).updateChildValues(["pw":pw])
        
        completion()
    }
    
    // MARK: - try Login
    func tryLogin(id: String, pw: String, completion: @escaping (Bool) -> () ) {
        // download PW only once
        dbRef.child("Users").child(id).child("pw").observeSingleEvent(of: .value, with: {
            let originPW = $0.value as? String
            // if right pw -> completion(true)
            pw == originPW ? completion(true) : completion(false)
        }) {
            // if network error
            completion(false)
            print($0.localizedDescription)
        }
    }
    
    
}
