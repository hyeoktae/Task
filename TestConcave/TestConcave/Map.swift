//
//  Map.swift
//  TestConcave
//
//  Created by hyeoktae kwon on 19/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol ChangePlayerDelegate {
    func changePlayer(_ state: Bool)
    func winner(_ who: Bool)
}

class Map: UIView {
    
    var delegate: ChangePlayerDelegate?
    
    var maps = [UILabel]()
    var btns = [UIButton]()
    var turn = false
    
    init(x: CGFloat, y: CGFloat, scale: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: scale, height: scale))
        makeMap()
        makebtn()
        maps.forEach{ self.addSubview($0) }
        btns.forEach{ self.addSubview($0) }
    }
    
    func makeMap() {
        let width = self.frame.width/12
        for i in 0...11{
            for j in 0...11 {
                
                let label: UILabel = {
                    let l = UILabel(frame: CGRect(x: width * CGFloat(i), y: width * CGFloat(j), width: width, height: width))
                    l.layer.borderWidth = 0.5
                    return l
                }()
                maps.append(label)
            }
        }
    }
    
    func makebtn() {
        let width = self.frame.width/12
        var tag = 1
        for i in 0...10{
            for j in 0...10{
                
                let btn: UIButton = {
                    let btn = UIButton(frame: CGRect(x: width * CGFloat(j) + width/1.5, y: width * CGFloat(i) + width/1.5, width: width/1.5, height: width/1.5))
                    btn.layer.borderWidth = 0.5
                    btn.layer.cornerRadius = width/3
                    btn.backgroundColor = .white
                    btn.tag = tag
                    btn.alpha = 0.1
                    btn.addTarget(self, action: #selector(didTapBtns(_:)), for: .touchUpInside)
                    btn.setTitle("\(i),\(j)", for: .normal)
                    return btn
                }()
                btns.append(btn)
                tag += 1
            }
        }
    }
    
    @objc func didTapBtns(_ sender: UIButton) {
        for i in 1...121 {
            switch sender.tag {
            case i:
                sender.backgroundColor = turn ? .black : .white
                sender.alpha = 1
                sender.isEnabled = false
                let x = Int((sender.titleLabel?.text!.components(separatedBy: ",")[0])!)
                let y = Int((sender.titleLabel?.text!.components(separatedBy: ",")[1])!)
                saveStones(x: x!, y: y!, player: turn)
                turn.toggle()
                delegate?.changePlayer(turn)
                sender.setTitle("", for: .normal)
            default:
                break
            }
        }
        if gameOver {
            btns.forEach{ $0.isEnabled = false }
            delegate?.winner(winner)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Map: ResetDelegate{
    func resetBtn() {
        btns.forEach{ $0.alpha = 0.1; $0.isEnabled = true; $0.backgroundColor = .white }
        turn = false
        winner = false
        gameOver = false
        delegate?.changePlayer(turn)
    }
}
