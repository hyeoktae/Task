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
    private var refreshControl = UIRefreshControl()
    @objc var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBarButton()
//        creatFriednsListLabel() // 이거 주석해제하고 creatTableView() 주석처리하면 예전으로 돌아감
        addFriendsName()
        creatTableView()
    }
    
    func creatTableView() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        }
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
        
        
    }
    
    @objc func refresh() { // 혹시나 데이터 리로드 안되면 이걸로 리로드
        tableView.reloadData()
        refreshControl.endRefreshing()
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
        
        friendsName.append(text) // 이전: friendsName.append(text+"\n")
        print(friendsName)
        friendsListLabel.text = ""
        friendsListLabel.numberOfLines = 0
        
        for i in 0..<friendsName.count {
            guard let text = friendsListLabel.text else {
                return
            }
            beforeTextField = text + "\(friendsName[i])"
            friendsListLabel.text = beforeTextField
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "초기화")
        tableView.reloadData() // 새로 추가된 데이터 reload 이거찾는데 오래걸렸음
    }
}


extension FriendsListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView: 일함")
        return friendsName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = friendsName[indexPath.row]

        return cell
    }
}
