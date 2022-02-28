//
//  TrailerViewController.swift
//  
//
//  Created by Eric Tang on 2/27/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {

	var trailerURL: URL!
	@IBOutlet weak var trailerVideo: WKWebView!
	
	override func loadView() {
		let webConfiguration = WKWebViewConfiguration()
		trailerVideo = WKWebView(frame: .zero, configuration: webConfiguration)
		trailerVideo.uiDelegate = self
		view = trailerVideo
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print(trailerURL)
		let myRequest = URLRequest(url: trailerURL!)
		trailerVideo.load(myRequest)
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


