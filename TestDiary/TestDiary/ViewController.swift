//
//  ViewController.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 29/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tblView: UITableView = {
        let tblView = UITableView()
        tblView.rowHeight = 60
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tblView
    }()
    var header: String? {
        get{ return editInfo.editHeader }
        set{ editInfo.editHeader = newValue }
    }
    var idx: IndexPath? {
        get{ return editInfo.idx }
        set{ editInfo.idx = newValue }
    }
    var editInfo = EditInfo(editHeader: nil, idx: nil)
    let addVC = AddVC()
    var sort = datas.keys.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tblView)
        makeMainView()
        autoLayout()
        tblView.dataSource = self
        tblView.delegate = self
        addVC.delegate = self
    }
    
    func makeMainView() {
        let mainView = MainView(frame: CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: 120))
        mainView.delegate = self
        view.addSubview(mainView)
    }
    
    func autoLayout() {
        tblView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        tblView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandable[sort[section]] ?? false ? datas[sort[section]]?
            .count ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        cell?.textLabel?.text = datas[sort[indexPath.section]]![indexPath.row].title
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sort.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width - 20, height: 40))
        headerView.delegate = self
        headerView.secIndex = section
        headerView.btn.setTitle(sort[section], for: .normal)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expandable[sort[indexPath.section]]! ? 60 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "수정") { (action, sourceView, actionFerfomed) in
            self.edit(indexPath)
            actionFerfomed(true)
        }
        let delete = UIContextualAction(style: .destructive, title: "삭제") { (action, sourceView, actionFerfomed) in
            self.delete(indexPath)
            actionFerfomed(true)
        }
//        여기다가 다른 무언가 쓰면 오류
//        tblView.reloadData()
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addVC.titleTF.text = datas[sort[indexPath.section]]?[indexPath.row].title
        addVC.contents.text = datas[sort[indexPath.section]]?[indexPath.row].contents
        addVC.addBTN.isEnabled = false
        addVC.addBTN.isHidden = true
        present(addVC, animated: true)
    }
    
    func edit(_ indexPath: IndexPath) {
        addVC.titleTF.text = datas[sort[indexPath.section]]?[indexPath.row].title
        addVC.contents.text = datas[sort[indexPath.section]]?[indexPath.row].contents
        header = sort[indexPath.section]
        idx = indexPath
        present(addVC, animated: true)
    }
    
    func delete(_ indexPath: IndexPath) {
        datas[self.sort[indexPath.section]]?.remove(at: indexPath.row)
        if datas[self.sort[indexPath.section]]!.isEmpty {
            datas.removeValue(forKey: self.sort[indexPath.section])
        }
        reload()
    }
}


extension ViewController: HeaderViewDelegate {
    func callHeader(idx: Int) {
        expandable[sort[idx]] = !expandable[sort[idx]]!
        tblView.reloadSections([idx], with: .automatic)
    }
}


extension ViewController: MainViewDelegate {
    func toAddVC() {
        addVC.titleTF.text = nil
        addVC.contents.text = nil
        present(addVC, animated: true)
    }
}


extension ViewController: AddVCDelegate {
    func addData(title: String?, content: String?) {
        let text = title == "" ? "제목없음" : title
        if header != nil {
            datas[header!]?[(idx?.row)!].title = text!
            datas[header!]?[(idx?.row)!].contents = content ?? ""
        } else if datas[CurrentDate.shared.currentDate()] == nil {
            datas.updateValue([DataModel(title: text, contents: content)], forKey: CurrentDate.shared.currentDate())
            expandable.updateValue(false, forKey: CurrentDate.shared.currentDate())
        } else {
            datas[CurrentDate.shared.currentDate()]?.append(DataModel(title: text, contents: content))
        }
        reload()
        addVC.contents.text = nil
        addVC.titleTF.text = nil
        header = nil
        idx = nil
    }
    
    func reload() {
        self.sort = datas.keys.sorted()
        self.tblView.reloadData()
    }
}
