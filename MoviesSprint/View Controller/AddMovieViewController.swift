//
//  AddMovieViewController.swift
//  MoviesSprint
//
//  Created by Stephanie Ballard on 8/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    var movieDelegate: MovieDelegate?
    
    @IBOutlet weak var movieTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        
        if let newMovie = movieTitleTextField.text,
            !newMovie.isEmpty {
            let movie = Movie(movieTitle: newMovie)
            
            movieDelegate?.newMovieAdded(movie: movie)
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
