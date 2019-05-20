//
//  ViewController.swift
//  TestConcave
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol ResetDelegate {
    func resetBtn()
}

class ViewController: UIViewController {
    
    var delegate: ResetDelegate?
    
    let winnerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(50)
        l.layer.borderWidth = 1
        l.textAlignment = .center
        l.isHidden = true
        return l
    }()
    
    let player: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = l.font.withSize(50)
        l.layer.borderWidth = 1
        l.text = "Player 1"
        l.textAlignment = .center
        return l
    }()
    
    let resetBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("RESET", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(resetAll(_:)), for: .touchUpInside)
        btn.tag = 200
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let map = Map(x: 20, y: 50, scale: view.frame.width - 40)
        view.addSubview(map)
        view.addSubview(resetBtn)
        view.addSubview(player)
        view.addSubview(winnerLabel)
        autoLayout()
        self.delegate = map
        map.delegate = self
    }
    
    @objc func resetAll(_ sender: UIButton) {
        delegate?.resetBtn()
        winnerLabel.isHidden = true
        winnerLabel.text = ""
        poMap.forEach{ $0.forEach{ $0.stone = 0 } }
    }
    
    func autoLayout() {
        winnerLabel.bottomAnchor.constraint(equalTo: player.topAnchor, constant: -30).isActive = true
        winnerLabel.leadingAnchor.constraint(equalTo: player.leadingAnchor).isActive = true
        winnerLabel.trailingAnchor.constraint(equalTo: player.trailingAnchor).isActive = true
        
        player.bottomAnchor.constraint(equalTo: resetBtn.topAnchor, constant: -30).isActive = true
        player.leadingAnchor.constraint(equalTo: resetBtn.leadingAnchor).isActive = true
        player.trailingAnchor.constraint(equalTo: resetBtn.trailingAnchor).isActive = true
        
        resetBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        resetBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        resetBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
}

extension ViewController: ChangePlayerDelegate {
    func winner(_ who: Int) {
        winnerLabel.isHidden = false
        winnerLabel.text = "Player\(who) WIN"
    }
    
    func changePlayer(_ state: Bool) {
        player.text = state ? "Player 2" : "Player 1"
    }
    
    
    
    
}
