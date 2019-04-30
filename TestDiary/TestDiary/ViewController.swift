//
//  ViewController.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 29/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let addVC = AddVC()
    
    var datas = [DataModels]()
    
    var tblView: UITableView = {
        let tblView = UITableView()
        tblView.rowHeight = 60
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeMainView()
        view.addSubview(tblView)
        autoLayout()
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

extension ViewController: UITableViewDataSource, UITabBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].headerName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = datas[indexPath.section].datas[indexPath.row].title
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    
    
}




extension ViewController: MainViewDelegate {
    func toAddVC() {
        present(addVC, animated: true)
    }
}

extension ViewController: AddVCDelegate {
    func addData(title: String?, content: String?) {
        datas.append(DataModels(data: DataModel(title: title, contents: content)))
    }
}

