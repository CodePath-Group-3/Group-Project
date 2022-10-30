//
//  PosterViewCell.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit
import Parse

class PosterViewCell: UITableViewCell {
    
    var movies = [[String:Any]]()

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var medianameLabel: UILabel!
    @IBOutlet weak var movieId: UILabel!
    
    @IBAction func onLike(_ sender: Any) {
        let liked = PFObject(className: "Liked")
        if let text = movieId.text, let value = Int(text){
            print(value)
            liked["mediaId"] = value
        } else {
            print("ID error")
        }
        liked["user"] = PFUser.current()!
        
        liked.saveInBackground { (success,error) in
            if success {
                print("Saved")
            } else {
                print("Error")
            }
        }
    }
    
    @IBAction func onDislike(_ sender: Any) {
        let disliked = PFObject(className: "Diliked")
        if let text = movieId.text, let value = Int(text){
            print(value)
            disliked["mediaId"] = value
        } else {
            print("ID error")
        }
        disliked["user"] = PFUser.current()!
        
        disliked.saveInBackground { (success,error) in
            if success {
                print("Saved")
            } else {
                print("Error")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
