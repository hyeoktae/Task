//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
    }
    
    func makeTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 60
        view.addSubview(tableView)
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
    }
    
}

// MARK: - UITableViewDataSource



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let product = saleArray[indexPath.row]
        cell.delegate = self
        cell.imageView?.image = product.image
        cell.textLabel?.text = product.name
        cell.stock.text = "\(product.count)"
        
        
        
        return cell
    }
}

extension ViewController: ItemCellDelegate {
    func addCount(_ itemCell: ItemCell, didTapButton: UIButton) {
        if let indexPath = tableView.indexPath(for: itemCell) {
            let count = saleArray[indexPath.row].count
            let stock = saleArray[indexPath.row].stock
            if count < stock {
            let addCount = count + 1
            saleArray[indexPath.row].count = addCount
            itemCell.stock.text = "\(addCount)"
            } else {
                print("재고부족")
                UIView.animate(withDuration: 0.2) {
                    itemCell.backgroundColor = .red
                    itemCell.backgroundColor = .white
                }
            }
        }
    }
    
    
}

