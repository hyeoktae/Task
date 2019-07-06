//
//  MainVC.swift
//  TestNetflixPlayer
//
//  Created by hyeoktae kwon on 2019/07/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import AVKit

final class PlayerVC: UIViewController {
  
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  private var player: AVPlayer?
  
  private let playerView = PlayerView()
  
  private var timeObserver: Any?
  
  var urlString: String?
  
  // Properties
  private let videoPlayerView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playerView.delegate = self
    setupAutoLayout()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupVideoPlayer()
  }
  
  private func setupVideoPlayer() {
    guard let url = URL(string: urlString ?? "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/hack_Final.mp4?alt=media&token=f7fc95a4-c470-443b-a17f-f6a87a03205a") else { return }
    
    player = AVPlayer(url: url)
    
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = videoPlayerView.bounds
    videoPlayerView.layer.addSublayer(playerLayer)
    //    player?.play()
    
    let interval = CMTime(seconds: 0.01, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    timeObserver = player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (elapsedTime) in
      self.updateVideoPlayerSlider()
    })
  }
  
  private func updateVideoPlayerSlider() {
    guard let currentTime = player?.currentTime() else { return }
    let currentTimeInSeconds = CMTimeGetSeconds(currentTime)
    playerView.progressSliderValue = Float(currentTimeInSeconds)
    if let currentItem = player?.currentItem {
      let duration = currentItem.duration
      if CMTIME_IS_INVALID(duration) {
        return
      }
      let currentTime = currentItem.currentTime()
      playerView.progressSliderValue = Float(CMTimeGetSeconds(currentTime) / CMTimeGetSeconds(duration))
    }
  }
  
  private func setupAutoLayout() {
    view.addSubview(videoPlayerView)
    view.addSubview(playerView)
    //    view.sendSubviewToBack(videoPlayerView)
    
    videoPlayerView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    
    playerView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    appDelegate.shouldSupportAllOrientation = false
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    appDelegate.shouldSupportAllOrientation = true
  }
  
}

extension PlayerVC: PlayerViewDelegate {
  func timeSeeking(value: Float64) {
    guard let duration = player?.currentItem?.duration else { return }
    let value = value * CMTimeGetSeconds(duration)
    guard !value.isNaN else { return }
    let seekTime = CMTime(value: CMTimeValue(value), timescale: 1)
    player?.seek(to: seekTime)
  }
  
  func didTapPlay() {
    print("didTapBtn In VC", player?.isPlaying)
    player!.isPlaying ? player?.pause() : player?.play()
  }
}

extension AVPlayer {
  var isPlaying: Bool {
    return rate != 0 && error == nil
  }
}
