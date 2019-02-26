//
//  PlaceController.swift
//  View Controller Containment and UITabBarController
//
//  Created by Spencer Curtis on 6/28/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class PlaceController {
    
    // CRUD
    
    func createPlace(withName name: String, latitude: Double, longitude: Double) {
        let place = Place(name: name, latitude: latitude, longitude: longitude)
        
        places.append(place)
    }
    
    // MARK: - Properties
    
    var places: [Place] = []
}
