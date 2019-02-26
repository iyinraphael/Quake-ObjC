//
//  TaskController.swift
//  Tasks
//
//  Created by Ngozi Ojukwu on 8/20/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    func saveToPersistence(){
         let moc = CoreDataStack.shared.mainContext
        do{
            try moc.save()
        }
        catch{
            moc.reset()
            NSLog("Error savig managed object context\(error)")
        }
    }
    
    func createTask(with name: String, notes: String?, priority: TaskPriority) {
        let _ = Task(name: name, notes: notes, priority: priority)
        saveToPersistence()
    }
    
    func update(task: Task, with name: String, notes: String?, priority: TaskPriority){
        task.name = name
        task.notes = notes
        task.priority = priority.rawValue
    }
    
    func delete(task: Task){
        let moc = CoreDataStack.shared.mainContext
        moc.delete(task)
        saveToPersistence()
    }
    
    var tasks: [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let moc = CoreDataStack.shared.mainContext
        
        do{
            return try moc.fetch(fetchRequest)
        }
        catch{
            print("There was an error")
            
            return []
        }
    }
}
