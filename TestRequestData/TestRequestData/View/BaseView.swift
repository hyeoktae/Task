//
//  BaseView.swift
//  TestRequestData
//
//  Created by hyeoktae kwon on 2019/06/23.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVFoundation

class BaseView: UIView {
    
    var player: AVAudioPlayer!

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func runBtn(_ sender: UIButton) {
        Network.shared.kakaoAPI(textView.text!) {
            self.player = try? AVAudioPlayer(data: $0)
            self.player.play()
        }
    }
    
}
