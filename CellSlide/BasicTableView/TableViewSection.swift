//
//  TableView02.swift
//  BasicTableView
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
   섹션을 나누어 데이터 목록 출력하기
   ***************************************************/
  
  override var description: String {
    return "TableView - Section"
  }

  lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
  let fruitsDict = [
    "A": ["Apple", "Avocado"],
    "B": ["Banana", "Blackberry"],
    "C": ["Cherry", "Coconut"],
    "D": ["Durian"],
//  ]
//    lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
////    lazy var sectionTitless: [String] = (fruitsDict["차"]?.sorted())!
//    let fruitsDict = [
//        "차": ["고정아", "김도영", "권혁태", "가가가"],
//        "아": ["유창근"],
//        "자": ["전혜지","전은석", "정창식"],
//        "ㄴ": ["차수연"],
//
    
    ]
    
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    //키의 개수만큼 섹션생성
    func numberOfSections(in tableView: UITableView) -> Int {
//        return fruitsDict.keys.count
        
        return sectionTitles.count  // 위에꺼랑 같은 방식
    }
    //섹션 넣어주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]  // tableVie에서 -> [section]셀렉션의index
    }
    
    
    // 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsDict[sectionTitles[section]]!.count
    }
    
    //셀의 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        //indexPath-> row, section
        let fruits = fruitsDict[sectionTitles[indexPath.section]]!
        cell.textLabel?.text = "\(fruits[indexPath.row])"
        return cell
    }
}
