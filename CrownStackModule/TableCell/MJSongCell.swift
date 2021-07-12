//
//  MJSongCell.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 10/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit

class MJSongCell: UITableViewCell {
    @IBOutlet var songImage : UIImageView!
    @IBOutlet var songView : UIView!
    @IBOutlet var songTitle : UILabel!
    @IBOutlet var songArtistName : UILabel!
    @IBOutlet var songTime : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        songImage.layer.cornerRadius = songImage.frame.width/2
        songImage.layer.masksToBounds = true
        songView.layer.cornerRadius = 2
        songView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
