//
//  LikedViewCell.swift
//  TinderforMedia
//
//  Created on 10/30/22.
//

import UIKit

class LikedViewCell: UITableViewCell {
    
    @IBOutlet weak var likedImage: UIImageView!
    @IBOutlet weak var medianameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
