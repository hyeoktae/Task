//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit




final class ProductViewController: UIViewController {
    
    
    
    var tableView = UITableView()
    var seed = Data.shared.pizzas
    var result = [basicData]()
    let detailVC = DetailViewController()
    
    func find() {
        for i in seed{
            if (i.folder == self.title){
                result.append(i)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        find()
        makeTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func makeTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.rowHeight = 120
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
    }
    
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ProductTableViewCell
        cell.productImg.image = UIImage(named: result[indexPath.row].Name)
        cell.name.text = result[indexPath.row].Name
        cell.price.text = "\(result[indexPath.row].price)원"
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailVC.title = result[indexPath.row].Name
        detailVC.imageView.image = UIImage(named: result[indexPath.row].Name)
        if ((Data.shared.countDict[result[indexPath.row].Name]) == nil) {
            Data.shared.countDict.updateValue(0, forKey: result[indexPath.row].Name)
        }
        detailVC.countLabel.text = "\(Data.shared.countDict[result[indexPath.row].Name] ?? 0) 개"
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ProductViewController: CategoryViewControllerDelegate {
    func reset() {
        result = []
        find()
        tableView.reloadData()
    }
    
    
}
