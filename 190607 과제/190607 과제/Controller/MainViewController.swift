//
//  MainViewController.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.searchController = searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
        
    }
    
    private func autoLayout() {
        view.addSubview(mainView)
        
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        print(searchText)
        Tracks.shared.images = []
        Tracks.shared.tracks = []
        mainView.showSpinner(onView: self.view)
        Networking.shared.download(searchText) {
            DispatchQueue.main.sync {
                self.mainView.reload()
                self.mainView.removeSpinner()
            }
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
}
