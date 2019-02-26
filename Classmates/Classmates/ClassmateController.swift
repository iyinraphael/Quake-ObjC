//
//  ClassmateController.swift
//  Classmates
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import Foundation

class ClassmateContoller {
    
    //a method that creates a classmate instance
    func createClassmate(withName name: String, favoriteColor: String, favoriteApp: String) -> Classmate {
        let classmate = Classmate(name: name, favoriteColor: favoriteColor, favoriteApp: favoriteApp)
        classmates.append(classmate)
        return classmate
    }
    
    func update(classmate: Classmate, withName name: String, favoriteColor: String, favoriteApp: String) {
        if let index = classmates.index(of: classmate){
            var scratch = classmate
            scratch.name = name
            scratch.favoriteColor = favoriteColor
            scratch.favoriteApp = favoriteApp
            
            classmates.remove(at: index)
            classmates.insert(scratch, at: index)
        }
    }
    
    private(set) var classmates: [Classmate] = []
}
