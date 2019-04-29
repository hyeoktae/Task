//
//  Data.swift
//  TableViewCellIncrease
//
//  Created by hyeoktae kwon on 28/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation


class DataModel {
    var headerName: String?
    var subType = [String]()
    var isExpandable: Bool = false
    
    init(headerName: String, subType: [String], isExpandable: Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}
