//
//  ViewController.swift
//  TestRXAmalofire
//
//  Created by hyeoktae kwon on 2019/06/09.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var vSpinner: UIView?
    
    let bag = DisposeBag()
    
    private let tableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.rowHeight = 80
        tbl.register(UINib(nibName: "TrackCell", bundle: nil), forCellReuseIdentifier: "cellId")
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.searchController = searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
//        searchController.searchBar.rx.setDelegate(self)
    }
    
    func autoLayout() {
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func bindTableView() {
        print("run")
        let trackOb: Observable<[Result]> = Observable.of((Track.shared.musics?.results) ?? []).observeOn(ConcurrentMainScheduler.instance)
        
        
        
        trackOb.bind(to: tableView.rx.items(cellIdentifier: "cellId")) { (index: Int, element: Result, cell: TrackCell) in
            cell.title.text = element.trackName
            cell.subTitle.text = element.artistName
            cell.imageView?.image = Track.shared.images![index]
        }.disposed(by: bag)
    }


}

extension ViewController {
    func showSpinner(onView : UIView) {
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.color = .black
        ai.center = onView.center
        
        DispatchQueue.main.async {
            onView.addSubview(ai)
        }
        vSpinner = ai
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        print(searchText)
        showSpinner(onView: self.view)
        Networking.shared.download(searchText, completion: {
            self.bindTableView()
            self.removeSpinner()
        })
    }
    
}


extension ViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
}
