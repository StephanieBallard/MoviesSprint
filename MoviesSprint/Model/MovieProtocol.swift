//
//  MovieProtocol.swift
//  MoviesSprint
//
//  Created by Stephanie Ballard on 8/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

protocol MovieDelegate {
    func newMovieAdded(movie: Movie)
    
    func updateMovie(movie: Movie)
}
