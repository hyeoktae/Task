//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
  
  /***************************************************
   테이블뷰 목록 수정하기 (insert, delete 등)
   ***************************************************/
  
  override var description: String {
    return "TableView - Editing"
  }
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  @objc func switchToEditing() {
    tableView.setEditing(!tableView.isEditing, animated: true) // -지우기
    //tableView.isEditing.toggle() 애니메이션이 없는거 상단이랑 같은 역할

  }
    
    //기본값 true
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none: print("none")
        case .insert: print("insert")
        data.insert(.random(in: 1...50), at: data.firstIndex(of: data[indexPath.row])!)
        tableView.insertRows(at: [indexPath], with: .automatic) //추가하는거
        case.delete: print("delete")
        data.remove(at: data.firstIndex(of: data[indexPath.row])!)  //데이터를 먼저 지우고 테이블뷰를 그 다음에 지워요
        tableView.deleteRows(at: [indexPath], with: .automatic)
        default: print("Default")
            //@unknown default: print("unkown case")
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //return .delete  기본값
        let row = indexPath.row
        if row.isMultiple(of: 3) {
            return .none
        } else if row % 3 == 1 {
            return .insert
        } else {
            return .delete
        }
    }
    
    /*
      iOS 8 ~ iOS 10
     */
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        print("-----[editActionsForRowAt]-----")
        
        let addAction = UITableViewRowAction(style: .default, title: "Add"){(action, indexPath) in print("Add")}
        
        let editAction = UITableViewRowAction(style: .normal, title: "edit"){(action, indexPath) in print("Edit")}
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete"){(action, indexPath) in print("delete")}
    
    return [addAction, editAction, deleteAction]
    }
    
    
    /* iOS 11 부터 가능*/
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        print("----[trailingSwipeAction]----")
//        let addAction = UIContextualAction(style: .normal, title: "Add") {
//        (action, sourceView, actionPerformed) in print("add Action")
//            actionPerformed(true)
//        }
//        addAction.backgroundColor = .green
//
//        let configuration = UISwipeActionsConfiguration(actions: [addAction])
//        configuration.performsFirstActionWithFullSwipe = true
//        return configuration
//
//    }
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        print("----[trailingSwipeAction]----")
//
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
//            (action, sourceView, actionPerformed) in print("delete Action")
//
//            self.data.remove(at: self.data.firstIndex(of: self.data[indexPath.row])!)
//            actionPerformed(true)
//        }
//        deleteAction.backgroundColor = .brown
//
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//
//
//        configuration.performsFirstActionWithFullSwipe = true
//        return configuration
//    }
}


// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
}

