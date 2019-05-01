//
//  ViewController.swift
//  TestSection
//
//  Created by hyeoktae kwon on 01/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tblView: UITableView = {
       let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tblView)
        autoLayout()
        tblView.dataSource = self
    }
    
    func autoLayout() {
        tblView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tblView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDatas[section].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        cell?.textLabel?.text = menuDatas[indexPath.section].products[indexPath.row].name
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuDatas.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuDatas[section].category
    }
}
