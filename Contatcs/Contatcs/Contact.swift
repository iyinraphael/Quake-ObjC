//
//  Contact.swift
//  Contatcs
//
//  Created by Iyin Raphael on 3/10/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation

class Contact: NSObject {
    
    @objc init(name: String, relationship: String?) {
        self.name = name
        self.relationship = relationship
    }
    
    @objc var name: String
    @objc var relationship: String?
}
