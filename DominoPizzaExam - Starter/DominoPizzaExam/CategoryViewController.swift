//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate: class {
    func reset()
}

final class CategoryViewController: UIViewController {
  
    weak var delegate: CategoryViewControllerDelegate?
    
    var tableView = UITableView()
    let headerVIew = UIImageView()
    let productVC = ProductViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeTableView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func makeTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(tableView)
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        tableView.rowHeight = 100
        headerVIew.image = UIImage(named: "logo")
        headerVIew.contentMode = .scaleAspectFit
        headerVIew.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerVIew.backgroundColor = .white
        tableView.tableHeaderView = headerVIew
    }
    
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.shared.logos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CategoryTableViewCell
        cell.imageView?.image = UIImage(named: Data.shared.logos[indexPath.row])
        
        return cell
    }
    
    
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productVC.title = Data.shared.logos[indexPath.row]
        self.delegate = productVC
        delegate?.reset()
        navigationController?.pushViewController(productVC, animated: true)
    }
}
