//
//  PlayerVIew.swift
//  TestNetflixPlayer
//
//  Created by hyeoktae kwon on 2019/07/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

protocol PlayerViewDelegate {
  func didTapPlay()
  func timeSeeking(value: Float64)
  func jumpForward()
  func jumpBackward()
  func didTapScreen()
}

class PlayerView: UIView {
  
  var delegate: PlayerViewDelegate?
  
  lazy var views = [playBtn, progressSlider, timeLabel, backwardBtn, forwardBtn, titleLabel]
  
  
  
  private let playBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 1
    btn.setImage(UIImage(named: "pause"), for: .normal)
    btn.setImage(UIImage(named: "play"), for: .selected)
    btn.addTarget(self, action: #selector(didTapBtns), for: .touchUpInside)
    return btn
  }()
  
  private let forwardBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 2
    btn.setImage(UIImage(named: "forward"), for: .normal)
    btn.addTarget(self, action: #selector(didTapBtns), for: .touchUpInside)
    return btn
  }()
  
  private let backwardBtn: UIButton = {
    let btn = UIButton()
    btn.tag = 3
    btn.setImage(UIImage(named: "backward"), for: .normal)
    btn.addTarget(self, action: #selector(didTapBtns), for: .touchUpInside)
    return btn
  }()
  
  private let progressSlider: UISlider = {
    let slider = UISlider()
    slider.thumbTintColor = .red
    slider.tintColor = .red
    slider.addTarget(self, action: #selector(progressSliderValueChanged(_:)), for: .valueChanged)
    return slider
  }()
  
  private let timeLabel: UILabel = {
    let label = UILabel()
    label.text = "00:00"
    label.textColor = .white
    return label
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Worlds Of The Last Jedi"
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  var progressSliderValue: Float = 0 {
    willSet(newValue) {
      progressSlider.value = newValue
    }
  }
  
  var timeLabelText: String = "00:00" {
    willSet(newTime) {
      timeLabel.text = newTime
    }
  }
  
  var titleLabelText: String = "" {
    willSet(newText) {
      titleLabel.text = newText
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
    addGestureRecognizer(tapGesture)
  }
  
  
  @objc private func tapScreen() {
    print("runInView")
    delegate?.didTapScreen()
  }
  
  @objc private func didTapBtns(_ sender: UIButton) {
    switch sender.tag {
    case 1:
      delegate?.didTapPlay()
      playBtn.isSelected.toggle()
    case 2:
      delegate?.jumpForward()
    case 3:
      delegate?.jumpBackward()
    default:
      break
    }
    
  }
  
  @objc private func progressSliderValueChanged(_ sender: UISlider) {
    delegate?.timeSeeking(value: Float64(progressSlider.value))
  }
  
  func showNavigator() {
    views.forEach { $0.isHidden = !$0.isHidden }
  }
  
  func hideNavigator() {
    views.forEach { $0.isHidden = true }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    views.forEach { self.addSubview($0) }
    
    playBtn.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.height.width.equalTo(50)
    }
    
    progressSlider.snp.makeConstraints {
      $0.leading.equalTo(18)
      $0.bottom.equalTo(-55)
      $0.trailing.equalTo(-75)
    }
    
    timeLabel.snp.makeConstraints {
//      $0.bottom.equalTo(-59)
      $0.trailing.equalTo(-20)
      $0.centerY.equalTo(progressSlider.snp.centerY)
    }
    
    forwardBtn.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.centerX.equalToSuperview().multipliedBy(1.5)
      $0.width.height.equalTo(60)
    }
    
    backwardBtn.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.centerX.equalToSuperview().multipliedBy(0.5)
      $0.width.height.equalTo(60)
    }
    
    titleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(self.snp.topMargin)
    }
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
