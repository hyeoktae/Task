//
//  ChatCell.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    let userNameLabel = UILabel()
    let chatTextBubbleView = UIView()
    let chatTextView = UITextView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setAutoLayout()
        configure()
    }
    
   
    
    func setAutoLayout() {
        contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        userNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
        contentView.addSubview(chatTextBubbleView)
        chatTextBubbleView.translatesAutoresizingMaskIntoConstraints = false
        chatTextBubbleView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive = true
        chatTextBubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        chatTextBubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 240).isActive = true
//        chatTextBubbleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        chatTextBubbleView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
//        chatTextBubbleView.heightAnchor.constraint(equalTo: chatTextView.heightAnchor, constant: 0).isActive = true

//        chatTextBubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        chatTextBubbleView.addSubview(chatTextView)
        chatTextView.translatesAutoresizingMaskIntoConstraints = false
        chatTextView.topAnchor.constraint(equalTo: chatTextBubbleView.topAnchor).isActive = true
        chatTextView.bottomAnchor.constraint(equalTo: chatTextBubbleView.bottomAnchor).isActive = true
        chatTextView.leadingAnchor.constraint(equalTo: chatTextBubbleView.leadingAnchor, constant: 5).isActive = true
        chatTextView.trailingAnchor.constraint(equalTo: chatTextBubbleView.trailingAnchor, constant: -5).isActive = true
//        chatTextView.widthAnchor.constraint(lessThanOrEqualToConstant: 230).isActive = true
    
            }
    
    
    func configure() {
        userNameLabel.backgroundColor = .blue
        userNameLabel.text = "sadfwefsadfasd \n sadklfwej;flka \n dasklf"
        userNameLabel.numberOfLines = 0
        
        chatTextView.text = "sadfwek;lf \n jsd;flwe \n jfkl;sadjfasd \n l;kfjwea;"
        chatTextView.backgroundColor = .cyan
//        chatTextBubbleView.backgroundColor = .cyan
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    

}
