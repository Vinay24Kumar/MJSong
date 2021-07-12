//
//  SplashVC.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 10/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func timerAction(){
        timer.invalidate()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MJSingListVC") as? MJSingListVC
        self.navigationController?.pushViewController(vc!, animated: true)
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
