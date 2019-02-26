//
//  ShoppingItem.swift
//  Sprint 2 Challenge
//
//  Created by Spencer Curtis on 7/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    
    let name: String
    var isAddedToList: Bool
    
    init(name: String, isAddedToList: Bool = false) {
        self.name = name
        self.isAddedToList = isAddedToList
    }
    
    var image: UIImage {
        return UIImage(named: name)!
    }
}
