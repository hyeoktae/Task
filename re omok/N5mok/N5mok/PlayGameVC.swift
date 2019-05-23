//
//  PlayGameVC.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController {
    
    let omokCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layoutState = true
    
    let timerMessageLabel = UILabel()
    let timerLabel = UILabel()
    
    
    var timer = Timer()
    var timeValue = 61

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(omokCollectionView)
        omokCollectionView.frame = view.frame
        omokCollectionView.delegate = self
        omokCollectionView.dataSource = self
        omokCollectionView.backgroundColor = .white
        omokCollectionView.isScrollEnabled = false
        
        omokCollectionView.register(ChatRoomCell.self, forCellWithReuseIdentifier: "chatRoomCell")
        omokCollectionView.register(OmokGameCell.self, forCellWithReuseIdentifier: "omokGameCell")
        
        setAutoLayout()
        configure()
        
        //        DispatchQueue.global().async {
        //            print("--------------------------[DispatchQueue 실행]--------------------------")
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerDispatchQueue(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func timerDispatchQueue(timer: Timer) {
        timeValue -= 1
        var minute = String(timeValue / 60).count == 1 ? "0\(timeValue/60)" : String(timeValue/60)
        var second = String(timeValue % 60).count == 1 ? "0\(timeValue%60)" : String(timeValue%60)
        
        self.timerLabel.text = "\(minute):\(second)"
        
        
        if timeValue == 0 {
            timer.invalidate()
            print("--------------------------[Timer 종료]--------------------------")
        }
        
    }
    
    
    func setAutoLayout() {
        let safeGuide = view.safeAreaLayoutGuide
        
        view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 40).isActive = true
        timerLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30).isActive = true
        timerLabel.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(timerMessageLabel)
        timerMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        timerMessageLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 10).isActive = true
        timerMessageLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30).isActive = true
        timerMessageLabel.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
        timerMessageLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configure() {
        timerMessageLabel.textAlignment = .center
        timerMessageLabel.textColor = .black
        timerMessageLabel.font = UIFont.boldSystemFont(ofSize: 22)
        timerMessageLabel.text = "남은시간"
        
        timerLabel.textAlignment = .center
        timerLabel.textColor = .black
        timerLabel.font = UIFont.systemFont(ofSize: 20)
        timerLabel.text = ""
        
        
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeGuide = view.safeAreaLayoutGuide
        
        if layoutState {
            let layout = omokCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            layout.itemSize = omokCollectionView.frame.size
            layout.scrollDirection = .horizontal
            
            omokCollectionView.translatesAutoresizingMaskIntoConstraints = false
            omokCollectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 100).isActive = true
            omokCollectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
            omokCollectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
            omokCollectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
            
        }
    }
    
    
    
    @objc func slideToChatCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: 1, section: 0)
        omokCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
    
    @objc func slideToOmokCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        omokCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
}

extension PlayGameVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if indexPath.row == 0 {
             let omokRoomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "omokGameCell", for: indexPath) as! OmokGameCell
            omokRoomCell.scrollBtn.addTarget(self, action: #selector(slideToChatCell(_:)), for: .touchUpInside)

            return omokRoomCell
        } else {
             let chatRoomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatRoomCell", for: indexPath) as! ChatRoomCell
            chatRoomCell.backBtn.addTarget(self, action: #selector(slideToOmokCell(_:)), for: .touchUpInside)
            
            return chatRoomCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    
    
    
    
    
}
