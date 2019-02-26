//
//  PlaceController.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

class PlaceController{
    var places: [Place] = []
    
    func createPlace(withName name: String, latitude: Double, longitude: Double) {
        let place =  Place(name: name, latitude: latitude, longitude: longitude)
        places.append(place)
    }
    
}
