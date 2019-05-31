//
//  FriendIDTableViewCell.swift
//  N5mok
//
//  Created by Alex Lee on 24/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FriendIDTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    
    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var scoreWinCountLabel: UILabel!
    @IBOutlet weak var scoreWinRateLabel: UILabel!
    
    @IBOutlet weak var vsBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        userLevelLabel.layer.cornerRadius = 5
        userLevelLabel.layer.masksToBounds = true
        userLevelLabel.text = "만만함ㅎㅎ"
        userLevelLabel.textColor = .white
        
        scoreTitleLabel.layer.borderWidth = 0.6
        scoreTitleLabel.layer.borderColor = #colorLiteral(red: 0.5516031384, green: 0.5731093287, blue: 0.5726275444, alpha: 1)
        scoreTitleLabel.layer.cornerRadius = 10
        
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        userImageView.layer.masksToBounds = true
        userImageView.contentMode = .scaleAspectFit
        
        vsBtn.layer.cornerRadius = vsBtn.frame.width/2
        vsBtn.layer.masksToBounds = true
        vsBtn.layer.opacity = 0.6
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
            backgroundColor = .black
            title = "보통"
        }
        userLevelLabel.backgroundColor = backbgroundColor
        userLevelLabel.text = title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
