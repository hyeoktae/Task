//
//  ViewController.swift
//  TableViewPratice
//
//  Created by hyeoktae kwon on 15/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var data = Array(1...50)
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 60
        view.addSubview(tableView)
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    @objc func addOne(_ sender: UIButton) {
        let cell = sender.superview?.superview as! CustomCellTableViewCell
    }
    
}



extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCellTableViewCell
        
        // delegate 로 푸는법
//        cell.delegate = self
//        cell.button.tag = indexPath.row
        
        if cell.textLabel?.text == nil {
            cell.button.addTarget(self, action: #selector(addOne(_:)), for: .touchUpInside)
        }
        
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

// delegate로 푸는 법
extension ViewController: CustomCellTableViewCellDelegate {
    func customCell(_ customCell: CustomCellTableViewCell, didTapButton: UIButton) {
        
        
        if let indexPath = tableView.indexPath(for: customCell) {
            let addedNumber = data[indexPath.row] + 1
            data[indexPath.row] = addedNumber
            customCell.textLabel?.text = "\(addedNumber)"
            
            
        }
    }
    
    
}


