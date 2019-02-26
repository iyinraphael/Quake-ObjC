//
//  SearchTableViewController.swift
//  StarWarsAPI
//
//  Created by Iyin Raphael on 8/14/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    let personController = PersonController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        personController.searchForPeopleWith(name: "Luke") {
            DispatchQueue.main.async {
                print("This function works")
                print(self.personController.people.count)
            }
            
            
        }
        
        

    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personController.people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  StarWarsTableViewCell else {return UITableViewCell()}
        let person = personController.people[indexPath.row]
        cell.person = person
        return cell
    }

    
    @IBOutlet weak var searchBar: UISearchBar!
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchBar.text else {return}
        
        personController.searchForPeopleWith(name: name) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
