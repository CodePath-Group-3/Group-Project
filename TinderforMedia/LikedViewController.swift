//
//  LikedViewController.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit
import Parse

class LikedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movieIds = [Int: Int]()
    let myQuery = PFQuery(className:"Liked")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedViewCell") as! LikedViewCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
