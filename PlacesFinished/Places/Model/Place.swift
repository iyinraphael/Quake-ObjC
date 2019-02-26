//
//  Place.swift
//  View Controller Containment and UITabBarController
//
//  Created by Spencer Curtis on 6/28/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import CoreLocation

struct Place {
    
    let name: String
    let location: (latitude: Double, longitude: Double)
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.location = (latitude: latitude, longitude: longitude)
    }
}
