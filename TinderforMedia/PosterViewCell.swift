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
        let findliked = PFQuery(className: "Liked")
        let findDisliked = PFQuery(className: "Disliked")
        if let text = movieId.text, let value = Int(text){
            print(value)
            //findliked.whereKey("userId", equalTo: PFUser.current())
            findliked.whereKey("mediaId", equalTo: value)
            findliked.getFirstObjectInBackground(block: { (object, error) in
                    if error == nil {
                        if let request = object {
                            print("Already in database")
                            print(request)
                        }
                    } else {
                        print("Not found!")
                        liked["user"] = PFUser.current()!
                        liked["mediaId"] = value
                        liked["title"] = String(self.medianameLabel.text!)
                        let imageData = self.posterImage.image!.jpegData(compressionQuality: 0.50)
                        let file = PFFileObject(name: "image.jpeg", data: imageData!)
                        liked["image"] = file
                        liked.saveInBackground { (success,error) in
                            if success {
                                print("Saved")
                            } else {
                                print("Error")
                            }
                        }
                    }
            })
            //findDisliked.whereKey("userId", equalTo: PFUser.current())
            findDisliked.whereKey("mediaId", equalTo: value)
            findDisliked.getFirstObjectInBackground(block: { (object, error) in
                    if error == nil {
                        if let request = object {
                            print(request)
                            request.deleteInBackground()
                        }
                    }
                })
        } else {
            print("ID error")
        }
    }
    
    @IBAction func onDislike(_ sender: Any) {
        let disliked = PFObject(className: "Disliked")
        let findLiked = PFQuery(className: "Liked")
        let findDisliked = PFQuery(className: "Disliked")
        if let text = movieId.text, let value = Int(text){
            print(value)
            //findDisliked.whereKey("userId", equalTo: PFUser.current())
            findDisliked.whereKey("mediaId", equalTo: value)
            findDisliked.getFirstObjectInBackground(block: { (object, error) in
                    if error == nil {
                        if let request = object {
                            print("Already in database")
                            print(request)
                        }
                    } else {
                        print("Not found!")
                        disliked["user"] = PFUser.current()!
                        disliked["mediaId"] = value
                        disliked.saveInBackground { (success,error) in
                            if success {
                                print("Saved")
                            } else {
                                print("Error")
                            }
                        }
                    }
            })
            //findLiked.whereKey("userId", equalTo: PFUser.current())
            findLiked.whereKey("mediaId", equalTo: value)
            findLiked.getFirstObjectInBackground(block: { (object, error) in
                    if error == nil {
                        if let request = object {
                            print(request)
                            request.deleteInBackground()
                        }
                    }
                })
            }
        else {
            print("ID error")
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
