//
//  PollingTabBarViewController.swift
//  Poll
//
//  Created by Carolyn Lea on 7/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class PollingTabBarViewController: UITabBarController {

    let voteController = VoteController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        passVoteControllerToChildViewControllers()
    }

    func passVoteControllerToChildViewControllers() {
        
        for childVC in childViewControllers {
            
            if let vc = childVC as? VoteControllerProtocol {
                
                vc.voteController = voteController
            }
        }
    }

}
