//
//  Device.swift
//  PutAndPost
//
//  Created by Iyin Raphael on 8/15/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation


struct Device: Codable {

    static func generateDevice() -> Device {
         return Device(model: Model.randomModel())
    }
    
    
    let uuid = UUID().uuidString
    let model: Model
    
    init(model: Model) {
        self.model = model
    }
}

enum Model: String, Codable {
    case iPhoneX = "iPhone X"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhone8 = "iPhone 8"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone7 = "iPhone 7"
    case iPhone6SPlus = "iPhone 6S Plus"
    case iPhone6S = "iPhone 6S"
    case iPhoneSE = "iPhone SE"
    
    static func members() -> [Model] {
        return [.iPhoneX, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE, .iPhone7Plus, .iPhone8Plus, .iPhone6SPlus]
    }
    
    static func randomModel() -> Model {
        let members = self.members()
        let whchModel = Int(arc4random_uniform(UInt32(members.count)))
        return members[whchModel]
    }
}
