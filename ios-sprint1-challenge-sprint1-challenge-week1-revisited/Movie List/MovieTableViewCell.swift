//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate: class {
    func isSeenButtonWasTapped(on cell: MovieTableViewCell)
}
    
class MovieTableViewCell: UITableViewCell {
    
    private func updateViews() {
        guard let movie = movie else { return }
        
        if movie.isSeen == false {
            isSeenButton.setTitle("Not Seen", for: .normal)
        } else {
            isSeenButton.setTitle("Seen", for: .normal)
        }
        
        movieLabel.text = movie.movie
        
    }
    
    @IBAction func isSeenWasTapped(_ sender: Any) {
        delegate?.isSeenButtonWasTapped(on: self)
    }
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: MovieTableViewCellDelegate?
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var isSeenButton: UIButton!
    
    
}

