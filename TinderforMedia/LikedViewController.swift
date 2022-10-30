//
//  LikedViewController.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit
import Parse

class LikedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var media = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedViewCell") as! LikedViewCell
        let data = media[indexPath.row]
        let id = data["mediaId"] as! Int
        print(id)
        cell.medianameLabel.text = String(id)
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

