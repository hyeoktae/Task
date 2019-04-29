//
//  ViewController.swift
//  TableViewCellIncrease
//
//  Created by hyeoktae kwon on 28/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    var data = [DataModel(headerName: "Men", subType: ["pants", "jeans", "Shits"], isExpandable: false),
                DataModel(headerName: "Kid", subType: ["pants", "jeans", "toys"], isExpandable: false),
                DataModel(headerName: "Wemen", subType: ["pants", "jeans", "Tint"], isExpandable: false),
                DataModel(headerName: "Uni", subType: ["Hood", "Jumper", "Socks"], isExpandable: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        makeTableView()
        tableView.tableFooterView = UIView()
    }
    
    func makeTableView() {
        
        view.addSubview(tableView)
        tableView.rowHeight = 40
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].isExpandable ? data[section].subType.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = data[indexPath.section].subType[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width - 20, height: 40))
        headerView.delegate = self
        headerView.secIndex = section
        headerView.btn.setTitle(data[section].headerName, for: .normal)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.section].isExpandable ? 40 : 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ViewController: HeaderViewDelegate {
    func callHeader(idx: Int) {
        data[idx].isExpandable = !data[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }
    
}
