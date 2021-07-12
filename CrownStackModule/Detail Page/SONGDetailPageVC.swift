//
//  SONGDetailPageVC.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 11/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit
import SDWebImage

class SONGDetailPageVC: UIViewController {
    @IBOutlet var songImage : UIImageView!
    @IBOutlet var songTitle : UILabel!
    @IBOutlet var songArtistName : UILabel!
    @IBOutlet var songTime : UILabel!
    @IBOutlet var censoredName : UILabel!
    @IBOutlet var trackName : UILabel!
     @IBOutlet var checkStream : UILabel!
    @IBOutlet var collectionNAme : UILabel!
    var songArray : SongData?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(songArray);
        let image = songArray?.artworkUrl100 ?? ""
        
        self.songImage.sd_setImage(with: URL.init(string: image), placeholderImage: UIImage(named:""),options:SDWebImageOptions.progressiveLoad, completed: { (image, error, cacheType, imageUrl) in
            self.songImage.image  =  image
        })
        self.songTitle.text = songArray?.trackName ?? ""
        self.songArtistName.text = songArray?.artistName ?? ""
        let time = songArray?.trackTimeMillis ?? 0
        let checkTime = time/60000
        self.songTime.text = "Time : \(checkTime) minute"
       
        self.censoredName.text = songArray?.collectionCensoredName ?? ""
        self.trackName.text = songArray?.trackCensoredName ?? ""
        self.collectionNAme.text = songArray?.collectionName ?? ""
        
        let cehckB =  songArray?.isStreamable
        if cehckB == false{
            self.checkStream.text = "False"
        }else{
             self.checkStream.text = "True"
        }
        
    }
    
       @IBAction func  buttontarget (_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
           }
 
   

}
