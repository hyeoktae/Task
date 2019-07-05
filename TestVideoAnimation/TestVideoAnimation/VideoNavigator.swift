//
//  VideoNavigator.swift
//  TestVideoAnimation
//
//  Created by hyeoktae kwon on 2019/07/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

protocol VideoNavigatorDelegate {
  func playVideo()
  func forward()
  func backward()
}

class VideoNavigator: UIView {
  
  var delegate: VideoNavigatorDelegate?
  
  let title: UILabel = {
    let label = UILabel()
    label.backgroundColor = .init(white: 1, alpha: 0)
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.text = "Infinity: War"
    return label
  }()
  
  lazy var forwardBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 1
    btn.addTarget(self, action: #selector(didTapButtons(_:)), for: .touchUpInside)
    btn.setImage(UIImage(named: "Forward"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  lazy var backwardBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 2
    btn.addTarget(self, action: #selector(didTapButtons(_:)), for: .touchUpInside)
    btn.setImage(UIImage(named: "Backward"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  lazy var playBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 3
    btn.addTarget(self, action: #selector(didTapButtons(_:)), for: .touchUpInside)
    btn.setImage(UIImage(named: "Play"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .init(white: 1, alpha: 0)
    addSubviews()
    autoLayout()
    
  }
  
  @objc func didTapButtons(_ sender: UIButton) {
    switch sender.tag {
    case 1:
      delegate?.forward()
    case 2:
      delegate?.backward()
    case 3:
      delegate?.playVideo()
    default:
      break
    }
  }
  
  func addSubviews() {
    let views = [backwardBtn, forwardBtn, title, playBtn]
    views.forEach { self.addSubview($0) }
  }
  
  func autoLayout() {
    title.snp.makeConstraints {
      $0.centerX.equalTo(self)
      $0.top.equalToSuperview().offset(10)
    }
    
    backwardBtn.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.centerX.equalTo(self).multipliedBy(0.5)
      $0.width.equalTo(self.snp.width).multipliedBy(0.05)
      $0.height.equalTo(self.snp.width).multipliedBy(0.055)
    }
    
    forwardBtn.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.centerX.equalTo(self).multipliedBy(1.5)
      $0.width.equalTo(self.snp.width).multipliedBy(0.05)
      $0.height.equalTo(self.snp.width).multipliedBy(0.055)
    }
    
    playBtn.snp.makeConstraints {
      $0.centerX.centerY.equalTo(self)
      $0.width.equalTo(self.snp.width).multipliedBy(0.05)
      $0.height.equalTo(self.snp.width).multipliedBy(0.055)
    }
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
