//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Eric Tang on 2/26/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

	@IBOutlet weak var backdropView: UIImageView!
	@IBOutlet weak var posterView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var synopsisLabel: UILabel!
	
	
	@IBAction func toTrailer(_ sender: UITapGestureRecognizer) {
		
	}
	
	var movie: [String:Any]!
	var trailerKey: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		titleLabel.text = movie["title"] as? String
		// does the same thing as autolayout, grows until fit
		titleLabel.sizeToFit()
		
		synopsisLabel.text = movie["overview"] as? String
		synopsisLabel.sizeToFit()
        
		// get poster, need base URL + dimension
		let baseUrl = "https://image.tmdb.org/t/p/w185"
		let posterPath = movie["poster_path"] as! String
		
		// URL() validates the link
		let posterUrl = URL(string: baseUrl + posterPath)
		
		// take care of downloading and setting image
		// !: aborts when no URL
		posterView.af.setImage(withURL: posterUrl!)
		
		let backdropPath = movie["backdrop_path"] as! String
		let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780"
 + backdropPath)
		
		backdropView.af.setImage(withURL: backdropUrl!)
		
		let movieId = String(describing: movie["id"]!)
		let trailerURL = URL(string: "https://api.themoviedb.org/3/movie/"
							 + "\(movieId)" + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
		// print(trailerURL)
		let request = URLRequest(url: trailerURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { (data, response, error) in

			if let error = error {
				print(error.localizedDescription)
	
			}
			else if let data = data {
				let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

				// print(dataDictionary)
				
				let videos = dataDictionary["results"] as! [[String:Any]]
				// print(videos)
				
				for video in videos {
					for (key, value) in video {
						if key == "type" && value as! String == "Trailer" {
							self.trailerKey = video["key"] as? String
							break
						}
					}
				}
				
				// print(self.trailerKey!)
				
			}
		}
		task.resume()
    }
    

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		// pass the selected movie to the details view controller
		// segue knows where its going, but we have to cast it
		 let trailerViewController = segue.destination as! TrailerViewController
		
		// set the movie variable in MovieDetailsViewController
		 trailerViewController.trailerURL = URL(string: "https://www.youtube.com/watch?v=\(trailerKey!)")!
	
	}


}
