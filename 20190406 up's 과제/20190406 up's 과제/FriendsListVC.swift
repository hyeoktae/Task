//
//  ViewController.swift
//  20190406 up's 과제
//
//  Created by hyeoktae kwon on 07/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit



class FriendsListVC: UIViewController {
    
    var friendsName: [String] = []
    var beforeTextField: String = ""
    
    @objc var friendsListLabel = UILabel()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        creatBarButton()
        creatFriednsListLabel()
        addFriendsName()
    }
    
    func creatFriednsListLabel() {
        friendsListLabel.frame = CGRect(x: 50, y: 150, width: view.frame.width-100, height: view.frame.height-300)
        friendsListLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        friendsListLabel.text = "친구없음"
        friendsListLabel.textAlignment = .center
        view.addSubview(friendsListLabel)
    }
    
    func creatBarButton() {
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        let toAddFriends = UIBarButtonItem(
            title: "친구추가",
            style: .done,
            target: self,
            action: #selector(toAddFriendsVC(_:)))
        navigationItem.rightBarButtonItem = toAddFriends
    }
    
    @objc private func toAddFriendsVC(_ sender: UIBarButtonItem) {
        let addFriendsVC = AddFriendsVC()
        navigationController?.pushViewController(addFriendsVC, animated: true)
        addFriendsVC.delegate = self
    }
    
    func addFriendsName() {
    }
}



extension FriendsListVC: AddFriendsVCDelegate {
    func sender(_ text: String?) {
        print("run")
        guard let text = text else {
            return
        }
        
        friendsName.append(text+"\n")
        print(friendsName)
        friendsListLabel.text = ""
        friendsListLabel.numberOfLines = 0
        
        for i in 0..<friendsName.count {
            guard let text = friendsListLabel.text else {
                return
            }
            beforeTextField = text + "\(friendsName[i])\n"
            friendsListLabel.text = beforeTextField
        }
    }
}


//extension FriendsListVC: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friendsName.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let currentRowOfList = friendsName[indexPath.row]
//        let currentName = friendsName[indexPath.row]
//
//        return cell
//    }
//
//
//
//
//}
