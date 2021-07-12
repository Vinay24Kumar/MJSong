//
//  MJSingListVC.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 10/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit
import SDWebImage



class MJSingListVC:UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var table : UITableView!
    var data : [SongData]?
    var viewModel = MJSongViewModel()
    var count = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingIndicator.sharedInstance.showOnWindow()
        viewModel.delegate = self
        viewModel.testParseJSON()
        self.table.addSubview(self.refreshControl)
        
    }
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

        print(self.data?.count)
        if count < 50{
            count = count + 5
            
        }
        self.table.reloadData()
        refreshControl.endRefreshing()
    }
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "MJSongCell"
        let cell:MJSongCell = self.table.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MJSongCell
        let dict = data?[indexPath.row]
        let image = dict?.artworkUrl100 ?? ""
        
        cell.songImage.sd_setImage(with: URL.init(string: image), placeholderImage: UIImage(named:""),options:SDWebImageOptions.progressiveLoad, completed: { (image, error, cacheType, imageUrl) in
            cell.songImage.image  =  image
        })
        cell.songTitle.text = dict?.trackName ?? ""
        cell.songArtistName.text = dict?.artistName ?? ""
        let time = dict?.trackTimeMillis ?? 0
        let checkTime = time/60000
        cell.songTime.text = "Time : \(checkTime) minute"
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC  = storyboard.instantiateViewController(withIdentifier: "SONGDetailPageVC") as? SONGDetailPageVC
        menuVC?.songArray = data?[indexPath.row]
        self.navigationController?.pushViewController(menuVC!, animated: true)
        
    }
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(MJSingListVC.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
}
extension MJSingListVC : SongTableData{
    
    
    
    func getData(data: MJSongModel?) {
        LoadingIndicator.sharedInstance.hide()
        //        print(data)
        self.data = data?.results
        count = 5
        table.reloadData()
        
    }
    
    
    func getError(message: String) {
        print(message)
    }
    
}

