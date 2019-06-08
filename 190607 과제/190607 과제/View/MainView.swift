//
//  MainView.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class MainView: UIView {
    
    var vSpinner: UIView?
    
    private let tableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.rowHeight = 80
        tbl.register(UINib(nibName: "TrackCell", bundle: nil), forCellReuseIdentifier: "cellId")
        return tbl
    }()
    
    func reload() {
        tableView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.dataSource = self
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tracks.shared.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TrackCell
        
        cell.TrackImgView.image = Tracks.shared.images[indexPath.row]
        cell.title.text = Tracks.shared.tracks[indexPath.row].name
        cell.subTitle.text = Tracks.shared.tracks[indexPath.row].artist
        return cell
    }
}


extension MainView {
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
}
