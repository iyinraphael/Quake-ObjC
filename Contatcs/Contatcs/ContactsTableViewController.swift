//
//  ContactsTableViewController.swift
//  Contatcs
//
//  Created by Iyin Raphael on 3/10/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsController.contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contactsController.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.relationship
        return cell
    }

    let contactsController = ContactController()
}
