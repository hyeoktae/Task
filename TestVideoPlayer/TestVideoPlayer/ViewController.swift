//
//  ViewController.swift
//  TestVideoPlayer
//
//  Created by hyeoktae kwon on 2019/07/04.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
  
  let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/hack_Final.mp4?alt=media&token=f7fc95a4-c470-443b-a17f-f6a87a03205a")!
  
//  lazy var player = AVPlayer(url: url)
  
  let playerViewController = AVPlayerViewController()
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
//    let item = AVPlayerItem(url: url)
//    let player = AVPlayer(playerItem: item)
    let player = AVPlayer(url: url)
    playerViewController.player = player
    present(playerViewController, animated: true) {
      player.play()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
//    Download.shared.downloadTask {
//      switch $0 {
//      case .failure(let err):
//        print(err)
//      case .success(let data):
//        print("success after", data)
//        let item = AVPlayerItem(url: self.url)
//        let player = AVPlayer(playerItem: item)
//        self.playerViewController.player = player
//        DispatchQueue.main.async {
//          self.present(self.playerViewController, animated: true, completion: {
//            self.playerViewController.player?.play()
//          })
//
//        }
//      }
//    }
  }


}

