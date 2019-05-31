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
    func downloadUsers(completion: @escaping (Bool) -> ()) {
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
                let nickName = detailData?["nickName"] as? String
                
                sampleUserInfo.append(UserInfo(ID: user, loginState: state ?? false, playerImg: img, vs: enemy ?? "", winCount: winCount ?? 0, loseCount: loseCount ?? 0, nickName: nickName ?? ""))
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
    
    func downloadMyInfo(ID: String, completion: @escaping () -> ()) {
        let IDforChild = ID.filter { $0 != "." }
        dbRef.child("Users").child(IDforChild).observeSingleEvent(of: .value) {
            
            let value = $0.value as? [String: Any]
            let state = value?["loginState"] as? Bool
            let img = (value?["playerImg"] as? String)?.toImage()
            let enemy = value?["vs"] as? String
            let winCount = value?["winCount"] as? Int
            let loseCount = value?["loseCount"] as? Int
            let nickName = value?["nickName"] as? String
            
            print("Firebase Nickname: ", nickName)
            self.dataModel.myLoginInfo.ID = ID
            self.dataModel.myLoginInfo.loginState = state ?? false
            self.dataModel.myLoginInfo.playerImg = img
            self.dataModel.myLoginInfo.loseCount = loseCount ?? 0
            self.dataModel.myLoginInfo.nickName = nickName ?? ""
            self.dataModel.myLoginInfo.vs = enemy ?? ""
            self.dataModel.myLoginInfo.winCount = winCount ?? 0
            
            
            completion()
        }
    }
    
    // New User's Info Upload to DB, must run before SignUp
    func uploadNewUser(ID: String, PW: String, NickName: String, completion: @escaping (Bool) -> () ) {
        
        let userImage = dataModel.myLoginInfo.playerImg?.toString()
        
        Auth.auth().createUser(withEmail: ID, password: PW) { (auth, error) in
            guard error == nil else {
                print("error", error?.localizedDescription)
                completion(false)
                return }
            print(auth)
            
            let child = ID.filter { $0 != "." }
            print("child: ", child)
            self.dbRef.child("Users").child(child).updateChildValues(["playerImg":userImage ?? ""])
            self.dbRef.child("Users").child(child).updateChildValues(["turn":false])
            self.dbRef.child("Users").child(child).updateChildValues(["vs":""])
            self.dbRef.child("Users").child(child).updateChildValues(["loginState":true])
            self.dbRef.child("Users").child(child).updateChildValues(["winCount":0])
            self.dbRef.child("Users").child(child).updateChildValues(["loseCount":0])
            self.dbRef.child("Users").child(child).updateChildValues(["loseCount":0])
            self.dbRef.child("Users").child(child).updateChildValues(["nickName":NickName])
            completion(true)
        }
        
        
        

        
        
        
    }
    
    // MARK: - try Login
    func tryLogin(id: String, pw: String, completion: @escaping (Bool) -> () ) {

        Auth.auth().signIn(withEmail: id, password: pw) { (auth, error) in
            guard auth != nil else {
                dump(error?.localizedDescription)
                completion(false)
                return
            }
            print("auth: ", auth)
            self.downloadUsers() {
                $0 ? completion(true) : print("fail")
            }
        }
        //        // download PW only once
        //        dbRef.child("Users").child(id).child("pw").observeSingleEvent(of: .value, with: {
        //            let originPW = $0.value as? String
        //            // if right pw -> completion(true)
        //            pw == originPW ? completion(true) : completion(false)
        //        }) {
        //            // if network error
        //            completion(false)
        //            print($0.localizedDescription)
        //        }
    }
    
    // MARK: - vsObserve
    // someone challenge to User, present ChallengerVC
    func vsObserve(myName: String, completion: @escaping (Bool) -> ()) {
        dbRef.child("Users").child(myName).child("vs").observe(.value) {
            let data = $0.value as? String
            if data != "" && data != "ok" {
                
            }
        }
    }
    
}
