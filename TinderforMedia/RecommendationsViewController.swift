//
//  RecommendationsViewController.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit
import Parse

class RecommendationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var liked = [PFObject]()
    var titles: AnyObject = NSDictionary()
    var recommended: AnyObject = NSDictionary()
    var recommendations: AnyObject = NSDictionary()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Liked")
        query.findObjectsInBackground { (liked, error) in
            if liked != nil {
                self.liked = liked!
                self.tableView.reloadData()
            } else {
                print("Error in database.")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var likedString = "";
        for data in liked {
            likedString += (data["title"]!) as! String + "%2C"
        }
        likedString = likedString.replacingOccurrences(of: " ", with: "+")
        likedString = likedString.replacingOccurrences(of: ",", with: "")
        likedString = String(likedString.dropLast(3))
        let urlString = "https://tastedive.com/api/similar?q=" + likedString
        let url = URL(string: urlString)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as AnyObject
                 self.recommendations = dataDictionary
             }
        }
        task.resume()
        self.recommended = recommendations["Similar"]! as AnyObject
        if recommended.count != nil {
            return 20
        } else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationsViewCell") as! RecommendationsViewCell
        let data = recommended["Results"] as AnyObject 
        if indexPath.row >= 0 {
            titles = data[indexPath.row]
            let title = titles["Name"]! as! String
            cell.medianameLabel.text = title
        }
        return cell
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
