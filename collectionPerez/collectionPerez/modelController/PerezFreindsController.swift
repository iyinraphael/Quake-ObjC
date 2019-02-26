//
//  PerezFreindsController.swift
//  collectionPerez
//
//  Created by Iyin Raphael on 7/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class PerezFreindsController {
    
    func createPerezFriend(name: String, favoriteColor: String, favoriteApp: String)->PerezFriend {
        let friend = PerezFriend(name: name, favoriteColor: favoriteColor, favoriteApp: favoriteApp)
        perezFriends.append(friend)
        return friend
    }
    
    func update(friend: PerezFriend, name: String, favoriteColor: String, favoriteApp: String) {
        guard let index = perezFriends.index(of: friend) else {return}
        
        var scratch = friend
        scratch.name = name
        scratch.favoriteColor = favoriteColor
        scratch.favoriteApp = favoriteApp
        
        perezFriends.remove(at: index)
        perezFriends.insert(scratch, at: index)
        
    }
    
    var perezFriends: [PerezFriend] = []
}

