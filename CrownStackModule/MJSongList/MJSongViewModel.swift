//
//  MJSongViewModel.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 10/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit
//import JTMaterialSpinner
protocol SongTableData {
    func getData(data :MJSongModel? )
    func  getError(message : String)
}
class MJSongViewModel: NSObject {
    
    var delegate : SongTableData?
    func testParseJSON() {
        //    let music = Music()
//        let spinnerView = JTMaterialSpinner()
//        spinnerView.circleLayer.lineWidth = 3.0
//        
//        // Change the color of the line
//        spinnerView.circleLayer.strokeColor = UIColor.red.cgColor
//        
//        // Change the duration of the animation
//        spinnerView.animationDuration = 2.5
//        spinnerView.beginRefreshing()
        
        
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "songs", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
//                print(data)
                do {
//                    print(data)
                    let resuestResponse = try JSONDecoder().decode(MJSongModel.self, from: data)
                   
                    self.delegate?.getData(data: resuestResponse)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
                
                
                
            } else {
                print("error")
            }
            
        } else {
            print("error")
        }
    }
}
