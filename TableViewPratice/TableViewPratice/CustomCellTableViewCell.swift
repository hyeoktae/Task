//
//  CustomCellTableViewCell.swift
//  TableViewPratice
//
//  Created by hyeoktae kwon on 15/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

// delegate 로 푸는거
protocol CustomCellTableViewCellDelegate: class {
    func customCell(_ customCell: CustomCellTableViewCell, didTapButton: UIButton)
}

final class CustomCellTableViewCell: UITableViewCell {
    
    // delegate 로 푸는거
    weak var delegate: CustomCellTableViewCellDelegate?
    let button = UIButton(type: .system)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(button)
        contentView.addSubview(button)
        button.setTitle("MyButton", for: .normal)
        button.backgroundColor = .yellow
        
        button.addTarget(self, action: #selector(addOne(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: frame.width - 120, y: 10, width: 80, height: frame.height - 20)
    }
    
    //오토레이아웃
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @objc func addOne(_ sender: UIButton) {
        delegate?.customCell(self, didTapButton: sender)
        
//        let add = Int(self.textLabel?.text ?? "")!
//        self.textLabel?.text = "\(add+1)"
    }
    
    
    
    // 스토리보드에서 작업할때 불러줌
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //선택되었을때 실행되는 메소드
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension CustomCellTableViewCell: UITableViewDelegate {
    
}
