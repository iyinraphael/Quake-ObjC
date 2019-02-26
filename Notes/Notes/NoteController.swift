//
//  NoteController.swift
//  Notes
//
//  Created by Iyin Raphael on 7/25/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class NoteController {
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
    
    func delete(note: Note) {
        guard let index =  notes.index(of: note) else {return}
        notes.remove(at: index)
        
        
    }
}
