//
//  UITableViewExtention.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//


import UIKit

protocol Identifiable {  //프로토콜은 형용사 느낌으로 많이 작성된다. 봉원 said
    static var identifier: String { get }
}

extension UITableViewCell: Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func register<Cell>(
        cell: Cell.Type,
        forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
        ) where Cell: UITableViewCell {
        register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell where Cell: UITableViewCell {
        guard let cell = dequeueReusableCell(
            withIdentifier: reusableCell.identifier
            ) as? Cell else { fatalError("Could not find cell with identifier") }
        
        return cell
    }
}
