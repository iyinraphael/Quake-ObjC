//
//  ClassmateTableViewController.swift
//  Classmates
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class ClassmateTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classmateController.classmates.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassmateCell", for: indexPath)

        // Configure the cell...
        let classmate = classmateController.classmates[indexPath.row]
        cell.textLabel?.text = classmate.name

        return cell
    }
    

    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddClassmate" {
            //Setup the detail view controller to add neww classmater
            guard let detailVC = segue.destination as? ClassmateDetailViewController else {return}
            
            detailVC.classmateController = classmateController 
        
        }else if segue.identifier == "ShowClassmateDetails"{
            guard let detailVC = segue.destination as? ClassmateDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else {return}
            
            detailVC.classmateController = classmateController
            detailVC.classmate = classmateController.classmates[indexPath.row]
        }
    }
    
    
    //MARk: - Properties
    let classmateController = ClassmateContoller()


}
