//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Ngozi Ojukwu on 8/20/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    let moc = CoreDataStack.shared.mainContext
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    @IBAction func Save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        let notes = notesTextView.text
        
        let priorityIndex = segmentCrl.selectedSegmentIndex
        let priority = TaskPriority.allPriorities[priorityIndex]
        
        if let task = task {
            //Editting existing task
            taskController.update(task: task, with: name, notes: notes, priority: priority)
        }else{
            taskController.createTask(with: name, notes: notes, priority: priority)
        }
        
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var segmentCrl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
   
    var task: Task? {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if isViewLoaded {
        
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        notesTextView.text = task?.notes
     }
    }
    let taskController = TaskController()
}
