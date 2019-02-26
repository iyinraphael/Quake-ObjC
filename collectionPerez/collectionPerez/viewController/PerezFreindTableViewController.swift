//
//  PerezFreindTableViewController.swift
//  collectionPerez
//
//  Created by Iyin Raphael on 7/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class PerezFreindTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
   

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return perezFriendsController.perezFriends.count
    }
@IBOutlet weak var nameLabel: UILabel!

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let perezFriend = perezFriendsController.perezFriends[indexPath.row]
        cell.textLabel?.text = perezFriend.name
        // Configure the cell...
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriend"{
            //we checking if the perezFirendDetailViewController is there and assigning it as an instant
            guard let detailViewController = segue.destination as? PerezFriendDetailViewController else {return}
            detailViewController.perezFriendControllerOption = perezFriendsController
            //this is button to view controller
        }else if segue.identifier == "ShowFriend"{
            guard let detailViewController = segue.destination as? PerezFriendDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            detailViewController.perezFriendControllerOption = perezFriendsController
            detailViewController.friend = perezFriendsController.perezFriends[indexPath.row]
        }
    }

    
    var perezFriendsController = PerezFreindsController()

}
