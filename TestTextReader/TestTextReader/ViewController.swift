//
//  ViewController.swift
//  TestTextReader
//
//  Created by hyeoktae kwon on 15/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudioKit

class ViewController: UIViewController {
    
    var audioFile: URL!
    var player: AVAudioPlayer!
    var timer: Timer!
    
    var textView: UITextView = {
        let v = UITextView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderWidth = 1
        
        return v
        
    }()
    
    var slider: UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.addTarget(self, action: #selector(sliderValue(_:)), for: .valueChanged)
        return s
    }()
    
    var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("재생", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.addTarget(self, action: #selector(read(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
    }
    
    func saveData(_ data: Data) -> URL{
        let documentURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = documentURL.appendingPathComponent("download.mp3")
        let saveFile = data.base64EncodedString()
        try? saveFile.write(to: documentURL, atomically: true, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        return filePath
    }
    // player init
    func initializePlayer() {
        guard let soundData = postman(textView.text!) else {
            print("재생불가")
            return
        }
        do {
            try self.player = AVAudioPlayer(data: soundData)
            self.player.delegate = self
        } catch(let error as NSError) {
            print("플레이어 초기화 실패")
            print("code: \(error.code), message: \(error.localizedDescription)")
        }
        
        self.slider.maximumValue = Float(self.player.duration)
        self.slider.minimumValue = 0
        self.slider.value = Float(self.player.currentTime)
    }
    // make timer and run
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            if self.slider.isTracking { return }
            
            self.slider.value = Float(self.player.currentTime)
        })
    }
    // timer 해제
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    @objc func sliderValue(_ sender: UISlider) {
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    @objc func read(_ sender: UIButton) {
        initializePlayer()
        
        
        sender.isSelected.toggle()
        
        if sender.isSelected {
            self.player.play()
            self.makeAndFireTimer()
        } else {
            self.player.pause()
            self.invalidateTimer()
        }
    }

    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(textView)
        view.addSubview(btn)
        view.addSubview(slider)
        
        textView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -20).isActive = true
        
        btn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        btn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        btn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        btn.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -20).isActive = true
        
        slider.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 20).isActive = true
        slider.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        slider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        slider.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
    }

}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류")
            return
        }
        print(error.localizedDescription)
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.btn.isSelected = false
        self.slider.value = 0
        self.invalidateTimer()
    }
}
