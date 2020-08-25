//
//  MovieTableViewCell.swift
//  MoviesSprint
//
//  Created by Stephanie Ballard on 8/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var hasBeenSeenButton: UIButton!
    @IBOutlet weak var movieTitleTextLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let movie = movie else { return }
        movieTitleTextLabel.text = movie.movieTitle
        if movie.hasBeenSeen == false {
            hasBeenSeenButton.setTitle("Not Seen", for: .normal)
        } else {
            hasBeenSeenButton.setTitle("Seen", for: .normal)
        }
    }
    
    @IBAction func hasBeenSeenButtonTapped(_ sender: UIButton) {
        guard let movie = movie else { return }
        NotificationCenter.default.post(name: .updateMovie, object: nil, userInfo: ["movie" : movie])
        updateViews()
    }
}

