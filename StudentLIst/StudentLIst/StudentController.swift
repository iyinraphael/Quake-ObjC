//
//  StudentController.swift
//  StudentLIst
//
//  Created by Iyin Raphael on 8/13/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class StudentController{
    
    func addStudentWith(name: String, completion: @escaping () -> Void){
        let student = Student(name: name)
        students.append(student)
        
        //This is to stimulate the unknown time it takes for a network call to complete
        
        let randomTime = Double(arc4random_uniform(5))
        
        print("Sleeping for \(randomTime) seconds")
        
        let backgroundQueue = DispatchQueue(label: "BackgroundQueue")
        
        backgroundQueue.async {
            Thread.sleep(forTimeInterval: randomTime)
            
            print("Done sleeping")
            
            self.students.append(student)
            
            completion()

        }
    }
    
    func delete(student: Student) {
        guard let index = students.index(of: student) else {return}
        students.remove(at: index)
    }
    
    var students: [Student] = []
}
