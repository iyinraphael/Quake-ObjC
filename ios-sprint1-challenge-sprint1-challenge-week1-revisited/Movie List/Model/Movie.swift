//
//  Movie.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Movie: Equatable {
    
    var movie: String
    var isSeen: Bool = false
    
    init(movie: String) {
        self.movie = movie
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.movie == rhs.movie &&
            lhs.isSeen == rhs.isSeen
    }
    
}
