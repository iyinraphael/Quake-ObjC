//
//  CombinedViewController.swift
//  Poll
//
//  Created by Carolyn Lea on 7/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CombinedViewController: UIViewController, VoteControllerProtocol {

    var voteController: VoteController?
    var resultTableViewController: ResultsTableViewController!
    var votingViewController: VotingViewController!
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tableVC = segue.destination as? ResultsTableViewController {
            resultTableViewController = tableVC
            resultTableViewController.voteController = voteController
        }
        
        if let voteVC = segue.destination as? VotingViewController {
            votingViewController = voteVC
            votingViewController.voteController = voteController
            
        }
        
    }
    

}
