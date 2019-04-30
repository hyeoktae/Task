//
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by 이봉원 on 11/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
  
  /***************************************************
   커스텀 셀 사용하기
   ***************************************************/
  
  override var description: String {
    return "TableView - CustomCell"
  }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 80
    view.addSubview(tableView)
 
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
    
    
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //공통으로 뭈을수 있는 부모 클래스 UITableViewCell 타입
    let cell: UITableViewCell
    
    //어떤 조건에서 어떤섹을 사용 할 것인지 결정
    if indexPath.row.isMultiple(of: 2) {
     cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
//        cell.backgroundColor = .green
        
        let customCell = cell as! CustomCell
        customCell.myLabel.text = "ABCDEF"
        customCell.myLabel.textColor = .black
        customCell.myLabel.backgroundColor = .yellow
    } else {
        cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
    }
    
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.imageView?.image = UIImage(named: "bear")
    
    /*
     cellForRowAt 메서드에서는 아직 cell 의 frame 이 제대로 설정되어 있지 않음. layout이 제대로 안 잡혀있는 단계
     */
    
//    (cell as? CustomCell)?.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
    
    return cell
  }
}


// MARK: - UITableViewDelegate

extension TableViewCustomCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(cell.frame.height)
        guard let customCell = cell as? CustomCell else { return }
        customCell.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
    }

}

