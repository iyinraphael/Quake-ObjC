//
//  ReadingListTableViewCell.swift
//  ReadingList(Persistence)
//
//  Created by Iyin Raphael on 8/7/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

protocol BookTableViewCellDelegate: class {
    func toggleHasBeenRead(for cell: ReadingListTableViewCell)
}




class ReadingListTableViewCell: UITableViewCell {
    
    //the contract for anyone acepting to be the delegate
    weak var delegate: BookTableViewCellDelegate?
    
    var book: Book?{
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let book = book else {return}
        bookLabel.text = book.title
        let image = book.hasBeenRead ? UIImage(named: "checked") : UIImage(named: "unchecked")
        isCompleteButton.setImage(image, for: .normal)
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    @IBOutlet weak var bookLabel: UILabel!
    
    @IBOutlet weak var isCompleteButton: UIButton!
}
