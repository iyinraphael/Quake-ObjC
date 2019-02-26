//
//  StudentListTableViewController.swift
//  StudentLIst
//
//  Created by Iyin Raphael on 8/13/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentController.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        
        let student = studentController.students[indexPath.row]
        
        cell.textLabel?.text = student.name

        return cell
    }
    


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let student = studentController.students[indexPath.row]
            
            //Always delete the model object you dele the row(cell)
            
            studentController.delete(student: student)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    @IBAction func addStudent(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        
        studentController.addStudentWith(name: name) {
            //the code in the braces will run after the add student function is completely done.
            
            //Triggered by the addstudentwith functions calling "completion()" inside of it.
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let studentController = StudentController()
    
    @IBOutlet weak var nameTextField: UITextField!
    
}
