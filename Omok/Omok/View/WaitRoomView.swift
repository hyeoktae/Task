//
//  WaitRoomView.swift
//  Omok
//
//  Created by hyeoktae kwon on 29/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class WaitRoomView: UIView {
    
    // MARK: - WaitRoomView's Properties
    private let refreshC = UIRefreshControl()
    
    let myInfoBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5702844858, blue: 0.2303800881, alpha: 0.351937072)
        view.layer.cornerRadius = 5
        return view
    }()
    
    let scoreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "전적"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreWinCountLabel: UILabel = {
        let label = UILabel()
        label.text = "W: 0  L: 0"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreWinRateLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userLevelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let IDlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "ID"
        label.textColor = .black
        return label
    }()
    
    let profileImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let IDTblView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(UINib(nibName: "FriendIDTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        tbl.rowHeight = 80
        tbl.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 0.4162296661)
        tbl.layer.cornerRadius = 5
        tbl.layer.masksToBounds = true
        tbl.allowsSelection = false
        tbl.separatorStyle = .none
        return tbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addsubviews()
    }
    
    func addsubviews() {
        let views = [IDTblView, profileImg, IDlabel, scoreWinRateLabel, scoreWinCountLabel, scoreTitleLabel, userLevelLabel, myInfoBackgroundView]
        views.forEach { self.addSubview($0) }
    }
    
    func decideUserLevel(winRate: Int) {
        var backbgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        var title = ""
        
        switch winRate {
        case 0...45 :
            backbgroundColor = #colorLiteral(red: 0.1458860338, green: 0.6174393296, blue: 0.1099483743, alpha: 1)
            title = "만만함ㅎㅎ"
        case 46...60 :
            backbgroundColor = #colorLiteral(red: 0.2611661553, green: 0.2594151497, blue: 0.6888753176, alpha: 1)
            title = "숙명의라이벌"
        case 61...100 :
            backbgroundColor = #colorLiteral(red: 0.8981249928, green: 0.0150892837, blue: 0, alpha: 1)
            title = "도망가는게상책"
        default :
            backbgroundColor = .black
            title = "보통"
        }
        userLevelLabel.backgroundColor = backbgroundColor
        userLevelLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let guide = self.safeAreaLayoutGuide
        
        myInfoBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        myInfoBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myInfoBackgroundView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 15).isActive = true
        myInfoBackgroundView.widthAnchor.constraint(equalTo: guide.widthAnchor, constant: -40).isActive = true
        myInfoBackgroundView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        profileImg.centerYAnchor.constraint(equalTo: myInfoBackgroundView.centerYAnchor).isActive = true
        profileImg.leadingAnchor.constraint(equalTo: myInfoBackgroundView.leadingAnchor, constant: 20).isActive = true
        profileImg.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.25).isActive = true
        profileImg.heightAnchor.constraint(equalTo: profileImg.widthAnchor, multiplier: 1).isActive = true
        profileImg.layer.cornerRadius = 15
        profileImg.layer.masksToBounds = true
        
        IDlabel.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 50).isActive = true
        IDlabel.topAnchor.constraint(equalTo: myInfoBackgroundView.topAnchor, constant: 40).isActive = true
        IDlabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        IDlabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        userLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        userLevelLabel.centerYAnchor.constraint(equalTo: IDlabel.centerYAnchor).isActive = true
        userLevelLabel.leadingAnchor.constraint(equalTo: IDlabel.trailingAnchor, constant: 10).isActive = true
        userLevelLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        userLevelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userLevelLabel.layer.cornerRadius = 5
        userLevelLabel.layer.masksToBounds = true
        
        
        scoreTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreTitleLabel.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 50).isActive = true
        scoreTitleLabel.topAnchor.constraint(equalTo: IDlabel.bottomAnchor, constant: 15).isActive = true
        scoreTitleLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        scoreTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        scoreWinCountLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreWinCountLabel.centerYAnchor.constraint(equalTo: scoreTitleLabel.centerYAnchor, constant: -9).isActive = true
        scoreWinCountLabel.leadingAnchor.constraint(equalTo: scoreTitleLabel.trailingAnchor, constant: 20).isActive = true
        scoreWinCountLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreWinCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scoreWinRateLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreWinRateLabel.centerYAnchor.constraint(equalTo: scoreTitleLabel.centerYAnchor, constant: 9).isActive = true
        scoreWinRateLabel.centerXAnchor.constraint(equalTo: scoreWinCountLabel.centerXAnchor).isActive = true
        scoreWinRateLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        scoreWinRateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        IDTblView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 170).isActive = true
        IDTblView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        IDTblView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        IDTblView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        IDTblView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.75).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

