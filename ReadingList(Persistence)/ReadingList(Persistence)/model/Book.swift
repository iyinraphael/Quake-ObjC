//
//  Book.swift
//  ReadingList(Persistence)
//
//  Created by Iyin Raphael on 8/7/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false){
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
}
