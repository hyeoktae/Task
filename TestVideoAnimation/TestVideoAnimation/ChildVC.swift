//
//  ChildVC.swift
//  TestVideoAnimation
//
//  Created by hyeoktae kwon on 2019/07/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

protocol ChildVCDelegate {
  func finishVideo()
}

class ChildVC: AVPlayerViewController {
  
  var customDelegate: ChildVCDelegate?
  
  var playerState = false
  
  let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/hack_Final.mp4?alt=media&token=f7fc95a4-c470-443b-a17f-f6a87a03205a")!
  
  lazy var videoPlayer = AVPlayer(url: url)
  
  let navigator = VideoNavigator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.showsPlaybackControls = false
    navigator.delegate = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    play()
    autoLayout()
  }
  
  
  
  func play() {
    
    NotificationCenter.default.addObserver(self, selector: #selector(didFinish(noti:)), name: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    
    self.player = videoPlayer
    self.player?.play()
    self.playerState.toggle()
  }
  
  @objc func didFinish(noti: NSNotification) {
    customDelegate?.finishVideo()
  }
  
  func autoLayout() {
    view.addSubview(navigator)
    
    navigator.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
}

//  self.dismiss(animated: true, completion: nil)

extension ChildVC: VideoNavigatorDelegate {
  func playVideo() {
    self.playerState ? self.player?.pause() : self.player?.play()
    self.playerState.toggle()
  }
  
  func forward() {
    guard let duration = player?.currentItem?.duration, let player = player else { return }
    let currentTime = CMTimeGetSeconds(player.currentTime())
    let newTime = currentTime + 10
    if newTime < (CMTimeGetSeconds(duration) - 10) {
      let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
      player.seek(to: time)
    }
    
  }
  
  func backward() {
    guard let player = player else { return }
    let currentTime = CMTimeGetSeconds(player.currentTime())
    var newTime = currentTime - 10
    if newTime < 0 {
      newTime = 0
    }
    let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
    player.seek(to: time)
  }
  
  
}
