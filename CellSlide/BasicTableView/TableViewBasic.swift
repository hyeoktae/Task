//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String {
    return "TableView - Basic"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    /**********************************************
     register - 재사용할 셀의 클래스를 미리 등록 가능
     새로운 아이디 -> 새로 등록
     같은 아이디 -> 이전에 등록한 클래스 업데이트
     ***********************************************/
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    //3번에 대한 필수!

  }
}

extension TableViewBasic: UITableViewDataSource {//반드시 필수! -> UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //10개의 데이터만 나타냄. (행의 개수)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**********************************************
         1) 셀 생성
         ***********************************************/
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CallId")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        /**********************************************
         2) 셀이 10만개 혹은 그 이상. 셀이 엄청 많을 때 -> 셀은 재사용이 필요. -코드
         ***********************************************/
//        let cell: UITableViewCell
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellId") {
//            cell = reusableCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        /**********************************************
         3) register 메서드를 사용해 미리 셀을 등록 가능 -스토리보드, 코드
         ***********************************************/
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) //dequeueReusableCell -> 재사용
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
}



