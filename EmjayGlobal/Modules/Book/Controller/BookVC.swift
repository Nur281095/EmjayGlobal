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
    }
    
    @IBAction func ocienFrTap(_ sender: Any) {
    }
    
    @IBAction func vehShipTap(_ sender: Any) {
    }
    
    @IBAction func airFrTap(_ sender: Any) {
    }
    
}