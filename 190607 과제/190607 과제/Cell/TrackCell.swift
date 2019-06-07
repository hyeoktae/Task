//
//  TrackCell.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/08.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class TrackCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var TrackImgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
