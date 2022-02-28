//
//  SuperheroDetailsViewController.swift
//  flixster
//
//  Created by Eric Tang on 2/27/22.
//

import UIKit
import AlamofireImage

class SuperheroDetailsViewController: UIViewController {

	var movie: [String:Any]!
	
	@IBOutlet weak var backdropView: UIImageView!
	@IBOutlet weak var posterView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var synopsisLabel: UILabel!
	
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
