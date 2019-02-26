//
//  NoteTableViewController.swift
//  Notes
//
//  Created by Iyin Raphael on 7/25/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class NoteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NoteTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        let note = noteController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        
        return noteCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the model object before we delete cell
            let note = noteController.notes[indexPath.row]
            noteController.delete(note: note)
            
            //the use is swiping to delete a cell
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
           
        }
    }
 
    @IBAction func saveNote(_ sender: Any) {
        guard let text = noteTextView.text else {return}
        
        noteController.createNote(withText: text)
        tableView.reloadData()
    }
    
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        let activityController =  UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController,animated: true, completion: nil)
    }
    
    let noteController = NoteController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noteTextView: UITextView!
}
