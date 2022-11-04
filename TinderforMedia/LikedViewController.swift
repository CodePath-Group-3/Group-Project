//
//  LikedViewController.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit
import Parse
import AlamofireImage

class LikedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var posterImage: UIImageView!
    
    var movie: [String:Any]!
    var movies = [[String:Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var media = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    var myCounter = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedViewCell") as! LikedViewCell
        let data = media[indexPath.row]
        let id = data["mediaId"] as! Int
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    self.movie = dataDictionary
             }
        }
        task.resume()
        let mdData = movie
        var posterPath = ""
        if mdData != nil {
            posterPath = mdData?["poster_path"]! as! String
        }
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterUrl = URL(string: baseUrl + posterPath)
        cell.posterImage.af_setImage(withURL: posterUrl!)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Liked")
        query.limit = 20
        query.findObjectsInBackground { (liked, error) in
            if liked != nil {
                self.media = liked!
                self.tableView.reloadData()
            } else {
                print("Error in database.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
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

