//
//  ViewController.swift
//  TestFirebase
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var db: Firestore!
    
    var ref: DocumentReference? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        
        db = Firestore.firestore()
        
        addData1()
        addData2()
        getData1()
        getData1()
    }
    func addData1() {
        ref = db.collection("test").addDocument(data: [
            "test1" : 1,
            "test2" : "2"
        ]) { err in
            if let err = err {
                print("error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
        print("adddata1 run")
    }
    
    func addData2() {
        ref = db.collection("test").addDocument(data: [
            "test1" : 1,
            "test2" : "2",
            "text3" : 3
        ]) { err in
            if let err = err {
                print("error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
        print("adddata2 run")
    }
    
    func getData1() {
        db.collection("test").getDocuments() {(data, error) in
            if let error = error {
                print("error adding document: \(error)")
            } else {
                for index in data!.documents {
                    print("\(index.documentID) => \(index.data())")
                }
            }
        }
        print("getdata1 run")
    }
    
}

