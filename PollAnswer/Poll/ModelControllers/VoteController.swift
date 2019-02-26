//
//  VoteController.swift
//  Poll
//
//  Created by Carolyn Lea on 7/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

class VoteController {
    
    var votes: [Vote] = []
    
    func createVote(with name:String, response:String){
        
        let vote = Vote(name: name, response: response)
        votes.append(vote)
    }
}
