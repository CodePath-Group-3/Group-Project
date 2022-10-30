//
//  PosterViewCell.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit

class PosterViewCell: UITableViewCell {
    
    var movies = [[String:Any]]()

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var medianameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var unlikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
