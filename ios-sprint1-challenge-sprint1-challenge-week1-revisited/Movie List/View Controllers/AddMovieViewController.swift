//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, MovieControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapToCreate(_ sender: Any) {
        guard let movie = addMovieTextField.text else { return }
        
        movieController?.createMovie(withName: movie)
    }

    var movieController: MovieController?
    
    @IBOutlet weak var addMovieTextField: UITextField!
}
