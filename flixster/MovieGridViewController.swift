//
//  MovieGridViewController.swift
//  flixster
//
//  Created by Eric Tang on 2/26/22.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	// movies requried for each screen
	var movies = [[String:Any]]()

	override func viewDidLoad() {
        super.viewDidLoad()

		// required
		collectionView.delegate = self
		collectionView.dataSource = self
		
		// flow layout: # items per row flexible
		let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		
		// space between rows
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		
		// width of the phone, changes based on orientation/device
		let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
		layout.itemSize = CGSize(width: width, height: width * 3/2)
		
		
		let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
				self.collectionView.reloadData()
				
				// print to console
				// print(self.movies)
				
				
			}
		}
		task.resume()
    }
    
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
		
		let movie = movies[indexPath.item]
		let baseUrl = "https://image.tmdb.org/t/p/w185"
		let posterPath = movie["poster_path"] as! String
		
		// URL() validates the link
		let posterUrl = URL(string: baseUrl + posterPath)
		
		cell.posterView.af.setImage(withURL: posterUrl!)
		return cell
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		//		Get the new view controller using segue.destination.
		//		Pass the selected object to the new view controller.
		// print("loading")
		
		// find the selected movie
		// sender is the thing you tap on
		let cell = sender as! UICollectionViewCell
		
		// find the index of the cell
		let indexPath = collectionView.indexPath(for: cell)!
		
		// access the movies array with
		let movie = movies[indexPath.row]
		
		// pass the selected movie to the details view controller
		// segue knows where its going, but we have to cast it
		let detailsViewController = segue.destination as! SuperheroDetailsViewController
		
		// set the movie variable in MovieDetailsViewController
		detailsViewController.movie = movie
		
		
	}

}
