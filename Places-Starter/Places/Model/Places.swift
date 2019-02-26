//
//  Places.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

struct Place {
    
    let name: String
    let location: (latitude: Double, longitude: Double)
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.location = (latitude: latitude, longitude: longitude)
    }
}
