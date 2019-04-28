//
//  WishListViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class WishListViewController: UIViewController {
    
    var tableView = UITableView()
    var names = [String]()
    var totalPrice = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        makeButtons()
        makeTableView()
        tabBarController?.delegate = self
        
    }
    
    
    
    @objc func toZero() {
        Data.shared.countDict = [:]
        names = []
        tableView.reloadData()
        totalPrice = 0
    }
    
    
    
    func makealert() {
        
        var message = ""
        for i in Data.shared.pizzas{
            for j in names{
                if (i.Name == j) {
                    guard let count = Data.shared.countDict[j] else {
                        return
                    }
                    totalPrice += i.price * count
                }
            }
        }
        for i in names{
            message = message + i + " - " + "\(Data.shared.countDict[i] ?? 0) 개\n"
        }
        
        
        let alert = UIAlertController(title: "결제내역", message: "\(message) 결제금액: \(totalPrice)", preferredStyle: .alert)
        let back = UIAlertAction(title: "돌아가기", style: .default)
        let order = UIAlertAction(title: "주문", style: .default, handler: {(alert: UIAlertAction!) in self.toZero()})
        alert.addAction(back)
        alert.addAction(order)
        self.present(alert, animated: true)
    }
  
    @objc func barButtonItems(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 1:
            toZero()
            
        case 2:
            makealert()
            
        default:
            return
        }
        tableView.reloadData()
        totalPrice = 0
    }
    
    func makeButtons() {
        let leftButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(barButtonItems))
        let rightButton = UIBarButtonItem(title: "주문", style: .done, target: self
            , action: #selector(barButtonItems))
        leftButton.tag = 1
        rightButton.tag = 2
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    func makeTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        tableView.rowHeight = 120
        view.addSubview(tableView)
    }
    
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ProductTableViewCell
        
        cell.imageView?.image = UIImage(named: names[indexPath.row])
        cell.name.text = names[indexPath.row]
        cell.price.text = "주문수량: \(Data.shared.countDict[names[indexPath.row]] ?? 0)"
        
        return cell
    }
    
    
}

extension WishListViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let lastVC = viewController.children.last as? DetailViewController else {
            print("run tapbarController")
            return
        }
        lastVC.countLabel.text = "\(Data.shared.countDict[lastVC.title!] ?? 0) 개"
    }
}
