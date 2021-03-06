//
//  MoviesViewController.swift
//  flixster
//
//  Created by Eric Tang on 2/19/22.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// return number of rows
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	// return cell for each row (for loop)
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// if cell is off the screen, reuse it to offload memory, cast it as MovieCell
		let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
		
		// indexPath.row: return row number
		let movie = movies[indexPath.row]
		// cast to string
		let title = movie["title"] as! String
		let synopsis = movie["overview"] as! String
		
		// place the content
		cell.titleLabel.text = title
		cell.synopsisLabel.text = synopsis
		
		// get poster, need base URL + dimension
		let baseUrl = "https://image.tmdb.org/t/p/w185"
		let posterPath = movie["poster_path"] as! String
		
		// URL() validates the link
		let posterUrl = URL(string: baseUrl + posterPath)
		
		// take care of downloading and setting image
		// !: aborts when no URL
		cell.posterView.af.setImage(withURL: posterUrl!)
		return cell
	}
	

	@IBOutlet weak var tableView: UITableView!
	
	// variables available if display on screen
	// array of dictionaries
	// () for creation
	var movies = [[String:Any]]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// necessary
		tableView.dataSource = self
		tableView.delegate = self
		
		
		let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { (data, response, error) in
			// This will run when the network request returns
			if let error = error {
				print(error.localizedDescription)
			} else if let data = data {
				let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				
				// results contains movie info
				self.movies = dataDictionary["results"] as! [[String:Any]]
				
				// reload data after downloading
				self.tableView.reloadData()
				
				// print to console
				 // print(dataDictionary)
				
				
			}
		}
		task.resume()
    }
	

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		Get the new view controller using segue.destination.
//		Pass the selected object to the new view controller.
		// print("loading")

		// find the selected movie
		// sender is the thing you tap on
		let cell = sender as! UITableViewCell

		// find the index of the cell
		let indexPath = tableView.indexPath(for: cell)!

		// access the movies array with
		let movie = movies[indexPath.row]

		// pass the selected movie to the details view controller
		// segue knows where its going, but we have to cast it
		 let detailsViewController = segue.destination as! MovieDetailsViewController

		// set the movie variable in MovieDetailsViewController
		 detailsViewController.movie = movie
		
		// deselect the cell after selecting and jumping
		tableView.deselectRow(at: indexPath, animated: true)

	}

}
