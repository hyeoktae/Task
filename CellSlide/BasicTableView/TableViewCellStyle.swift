//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
  
  /***************************************************
   셀 스타일 4가지 (default, subtitle, value1, value2)
   ***************************************************/
  
  override var description: String {
    return "TableView - CellStyle"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 70
    tableView.dataSource = self
    
    view.addSubview(tableView)
  }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // 재사용
    let cell: UITableViewCell
//    if let defaultCell = tableView.dequeueReusableCell(withIdentifier: "Default"){
//      cell = defaultCell
//    } else if let subtitleCell = tableView.dequeueReusableCell(withIdentifier: "subtitle"){
//        cell = subtitleCell
//    } else if let value1Cell = tableView.dequeueReusableCell(withIdentifier: "value1"){
//        cell = value1Cell
//    } else if let value2Cell = tableView.dequeueReusableCell(withIdentifier: "value2"){
//        cell = value2Cell
//    }
    
    if indexPath.row % 4 == 0 {
        // 셀 재사용 시도 후 없으면 생성
        cell = tableView.dequeueReusableCell(withIdentifier: "Default")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
    } else if indexPath.row % 4 == 1 {
        cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
    } else if indexPath.row % 4 == 2 {
        cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
            ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
    } else {
        cell = tableView.dequeueReusableCell(withIdentifier: "Value2")
            ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")
    }
    
    
    // 공통 속성 세팅
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.detailTextLabel?.text = "ABCDEFG"
    cell.imageView?.image = UIImage(named: "bear")
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
}

extension TableViewLifeCycle: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will Display Cell: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Did End Display Cell: \(indexPath.row)")
    }
}


