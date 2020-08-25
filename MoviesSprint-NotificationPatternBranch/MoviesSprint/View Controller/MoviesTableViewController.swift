//
//  MoviesTableViewController.swift
//  MoviesSprint
//
//  Created by Stephanie Ballard on 8/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = movies[indexPath.row]
        cell.movie = movie
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMovieShowSegue" {
            guard let addMovieVC = segue.destination as? AddMovieViewController else { return }
            addMovieVC.movieDelegate = self
        }
    }
}

extension MoviesTableViewController: MovieDelegate {
    func newMovieAdded(movie: Movie) {
        movies.append(movie)
        tableView.reloadData()
    }
    
    func updateMovie(movie: Movie) {
        guard let movieIndex = movies.firstIndex(of: movie) else { return }
        movies[movieIndex].hasBeenSeen.toggle()
        tableView.reloadData()
    }
}
