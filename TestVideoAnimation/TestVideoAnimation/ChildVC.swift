//
//  ChildVC.swift
//  TestVideoAnimation
//
//  Created by hyeoktae kwon on 2019/07/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ChildVC: AVPlayerViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
//      play()
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    play()
  }
  
  func play() {
    
    let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/hack_Final.mp4?alt=media&token=f7fc95a4-c470-443b-a17f-f6a87a03205a")!
    
    let player = AVPlayer(url: url)
    
    
    NotificationCenter.default.addObserver(self, selector: #selector(didFinish(noti:)), name: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    
    self.player = player
    self.player?.play()
    
  }
  
  @objc func didFinish(noti: NSNotification) {
    self.removeFromParent()
  }
  
}

//  self.dismiss(animated: true, completion: nil)

extension ChildVC: AVPlayerItemLegibleOutputPushDelegate {
  
}
