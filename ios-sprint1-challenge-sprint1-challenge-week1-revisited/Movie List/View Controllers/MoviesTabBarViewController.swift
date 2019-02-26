//
//  MoviesTabBarViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passMovieControllerToChildViewControllers()
    }

    func passMovieControllerToChildViewControllers() {
        for childVC in childViewControllers {
            if let childVC = childVC as? MovieControllerProtocol {
                childVC.movieController = movieController
            }
        }
    }

    let movieController = MovieController()
}
