//
//  DetailViewController.swift
//  ReadingList(Persistence)
//
//  Created by Iyin Raphael on 8/7/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        updateViews()
    }
    
    var bookController: BookController?
    //create book to see if it already exist
    var book : Book?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        
        guard isViewLoaded else {return}
        if let book = book{
            navigationController?.title = book.title
            titleTextField.text = book.title
            reasonToReadView.text = book.reasonToRead
        }else{
            navigationController?.title = "Add new book"
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let title = titleTextField.text, let reasonToRead = reasonToReadView.text else {return}
        
        if let book = book {
            bookController?.updateBookTitleandRead(book: book, title: title, reasonToRead: reasonToRead)
        }else{
        
        bookController?.create(title: title, reasonToRead: reasonToRead)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var reasonToReadView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
}
