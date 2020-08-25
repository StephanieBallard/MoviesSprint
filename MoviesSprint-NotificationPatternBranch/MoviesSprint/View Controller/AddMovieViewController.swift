//
//  AddMovieViewController.swift
//  MoviesSprint
//
//  Created by Stephanie Ballard on 8/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    
    @IBOutlet weak var movieTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        
        if let newMovie = movieTitleTextField.text,
            !newMovie.isEmpty {
            let movie = Movie(movieTitle: newMovie)
            
            NotificationCenter.default.post(name: .addMovie, object: nil, userInfo: ["title" : "\(movie)"])
            
            navigationController?.popViewController(animated: true)
        }
    }


}
