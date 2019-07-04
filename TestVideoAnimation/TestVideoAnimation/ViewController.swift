//
//  ViewController.swift
//  TestVideoAnimation
//
//  Created by hyeoktae kwon on 2019/07/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
  
  // 1. AVPlayerViewController 추가
  // 2. AVPlayerViewController 의 childViewController 추가
  // 3. ViewController 의 모든 코드를 childVC로 이동
  // 4. CustomView 만들고 이 컨트롤러에서 비디오를 플레이 시킨다. 
  
  var playerController = ChildVC()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    present(playerController, animated: true, completion: nil)
  }


}

