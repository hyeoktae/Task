//
//  FireBase.swift
//  Omok
//
//  Created by hyeoktae kwon on 26/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Firebase


// MARK: - FireBase Database Refernece
let dbRef = Database.database().reference()


extension Users {
    func downloadUsers() {
        dbRef.child("Users").observe(.value) { (snap) in
            let value = snap.value as? [String: Any]
            
        }
    }
}
