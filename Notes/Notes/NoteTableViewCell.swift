//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Iyin Raphael on 7/25/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: class {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {

    @IBAction func share(_ sender: Any) {
        delegate?.shareNote(for: self)
    }
    weak var delegate: NoteTableViewCellDelegate?
    
    private func updateView() {
        guard let note = note else {return}
        
        noteLabel.text = note.text 
    }
    
    var note: Note? {
        //right after property changes 
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var noteLabel: UILabel!
    
}
