//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Ngozi Ojukwu on 8/20/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String {
    
    case low
    case normal
    case high
    case critical
    
    static var allPriorities: [TaskPriority]{
        return [ .low, .normal, .high, .critical]
    }
}


extension Task{
    
    convenience init(name: String, notes: String?=nil, timestamp: Date = Date(), priority: TaskPriority = .normal, context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        //calling the designated initializer.
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.timestamp = timestamp
        self.priority = priority.rawValue
    }
}
