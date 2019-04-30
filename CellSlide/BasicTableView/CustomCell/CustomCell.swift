//
//  CustomCell.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let myLabel = UILabel()
 
       //코드로 생성시
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    // 커스텀 뷰를 올릴 때는 contentView 위에 추가
    contentView.addSubview(myLabel)
    myLabel.textColor = .black
  }
    
    //스토리보드 생성시
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //초기화 코드 작성
    }
  
  
  // 레이아웃 조정 시
  override func layoutSubviews() {
    
    //여기서 미리 하면 일일히 해줄필요없음
    myLabel.frame = CGRect(x: frame.width - 120, y: 15, width: 100, height: frame.height - 30)
  
    print("layoutSubViews")
    print("Cell frame: ", frame)
    
    super.layoutSubviews()
    
    }
}
