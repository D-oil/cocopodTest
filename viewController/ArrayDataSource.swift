//
//  ArrayDataSource.swift
//  viewController
//
//  Created by 董安东 on 2019/7/31.
//  Copyright © 2019 AdamDong. All rights reserved.
//

import Foundation
import UIKit

class ArrayDataSource : NSObject, UITableViewDataSource {
    
    var items : [String]
    var cellIdentifier : String
    
    var configureCell : ((UITableViewCell,String) -> Void)?
    
    init(items: [String], cellIdentifier: String) {
        self.items = items
        self.cellIdentifier = cellIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        let item = items[indexPath.row]
        configureCell!(cell,item)
        return cell
    }

}
