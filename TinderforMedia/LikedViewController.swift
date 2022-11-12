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
    
    @IBOutlet weak var tableView: UITableView!
    
    var liked = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liked.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedViewCell") as! LikedViewCell
        let data = liked[indexPath.row]
        cell.medianameLabel.text = data["title"]! as? String
        let imageFile = data["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.likedImage.af_setImage(withURL: url)
        return cell
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    */

}

