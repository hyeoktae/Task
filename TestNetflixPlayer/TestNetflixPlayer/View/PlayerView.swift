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
}

class PlayerView: UIView {
  
  var delegate: PlayerViewDelegate?
  
  private let playBtn: UIButton = {
    let btn = UIButton()
    btn.layer.borderWidth = 1
    btn.setImage(UIImage(named: "pause"), for: .normal)
    btn.setImage(UIImage(named: "play"), for: .selected)
    btn.addTarget(self, action: #selector(didTapPlayBtn), for: .touchUpInside)
    return btn
  }()
  
  private let progressSlider: UISlider = {
    let slider = UISlider()
    slider.thumbTintColor = .red
    slider.tintColor = .red
    slider.addTarget(self, action: #selector(progressSliderValueChanged(_:)), for: .valueChanged)
    return slider
  }()
  
  var progressSliderValue: Float = 0 {
    willSet(newValue) {
      progressSlider.value = newValue
    }
  }
  
  @objc func didTapPlayBtn(_ sender: UIButton) {
    delegate?.didTapPlay()
    playBtn.isSelected.toggle()
  }
  
  @objc private func progressSliderValueChanged(_ sender: UISlider) {
    delegate?.timeSeeking(value: Float64(progressSlider.value))
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let views = [playBtn, progressSlider]
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
  }

}
