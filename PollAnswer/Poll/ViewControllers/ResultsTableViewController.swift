//
//  ResultsTableViewController.swift
//  Poll
//
//  Created by Carolyn Lea on 7/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

protocol ResultsTableViewControllerDelegate: class {
    
    func voteWasSelected(vote: Vote)
}

class ResultsTableViewController: UITableViewController, VoteControllerProtocol {

    var voteController: VoteController?
    weak var delegate: ResultsTableViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return voteController?.votes.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RightDetail", for: indexPath)

        let vote = voteController?.votes[indexPath.row]
        cell.textLabel?.text = vote?.name
        cell.detailTextLabel?.text = vote?.response

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vote = voteController?.votes[indexPath.row] else {return}
        delegate?.voteWasSelected(vote: vote)
    }

}
