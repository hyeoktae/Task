//
//  ChatRoomCell.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ChatRoomCell: UICollectionViewCell {
    
    let chatTableView = UITableView()
    
    let containerView = UIView()
    let backBtn = UIButton()
    let textView = UITextView()
    let sendBtn = UIButton()
    
    struct chatUI {
        var textFieldSize: CGFloat = 60
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .cyan
        
        setAutoLayout()
        configure()
    }
    
    
    func setAutoLayout() {
        contentView.addSubview(chatTableView)
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        chatTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        chatTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        chatTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60).isActive = true
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        containerView.backgroundColor = .white
        
        containerView.addSubview(backBtn)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 33).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        containerView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 5).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        containerView.addSubview(sendBtn)
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        sendBtn.leadingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 5).isActive = true
        sendBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sendBtn.widthAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func configure() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
//        chatTableView.register(ChatCell.self, forCellReuseIdentifier: "chatCell")
        chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "chatCell")
//        chatTableView.rowHeight = 150
        chatTableView.estimatedRowHeight = 80
        chatTableView.rowHeight = UITableView.automaticDimension
        
        backBtn.setImage(UIImage(named: "backBtnIcon"), for: .normal)
        sendBtn.setImage(UIImage(named: "sendBtnIcon"), for: .normal)
        textView.layer.cornerRadius = 7
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension ChatRoomCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatTableViewCell
        
        return cell
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let chatCell = tableView.cellForRow(at: indexPath) as! ChatCell
//        return chatCell.contentView.frame.height
//    }

}


