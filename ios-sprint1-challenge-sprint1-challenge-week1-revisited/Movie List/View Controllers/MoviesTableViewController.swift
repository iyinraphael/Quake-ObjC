//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate, MovieControllerProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
        let movie = movieController?.movies[indexPath.row]
        movieCell.movie = movie
        movieCell.delegate = self
        
        return movieCell
    }

    func isSeenButtonWasTapped(on cell: MovieTableViewCell) {
        guard let indexPath = movieTableView.indexPath(for: cell) else { return }
        guard let movie = cell.movie else { return }

        movieController?.toggleIsSeen(for: movie)
        movieTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let movie = movieController?.movies[indexPath.row] else { return }
            movieController?.delete(movie: movie)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    var movieController: MovieController?
    
    @IBOutlet weak var movieTableView: UITableView!
    
}
