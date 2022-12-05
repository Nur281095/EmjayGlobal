//
//  BookVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit

class BookVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItems = [btnRight(image: "ic_profile", isOrignal: true), btnRight2(image: "ic_search", isOrignal: true)]
        self.navigationItem.title = "Book"
        setupWhiteNav()
    }
    
    @IBAction func perEffectTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .normalShipVC) as! NormalShipVC
        vc.navTitle = "Personal Effect"
        self.show(vc, sender: self)
    }
    
    @IBAction func ocienFrTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .normalShipVC) as! NormalShipVC
        vc.navTitle = "Ocean Freight"
        self.show(vc, sender: self)
    }
    
    @IBAction func vehShipTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .vehichleShipVC) as! VehichleShipVC
        vc.navTitle = "Vehicle Shipment"
        self.show(vc, sender: self)
    }
    
    @IBAction func airFrTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .normalShipVC) as! NormalShipVC
        vc.navTitle = "Air Freight"
        self.show(vc, sender: self)
    }
    
}
