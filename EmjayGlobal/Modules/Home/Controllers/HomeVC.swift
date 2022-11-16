//
//  HomeVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var barCodeBtn: UIButton!
    @IBOutlet weak var guestV: UIView!
    
    @IBOutlet weak var search: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guestV.isHidden = !Util.shared.isGuest
        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Home"
        setupWhiteNav()
    }
    
    override func btnRightAction(_ sender: Any) {
        if Util.shared.isGuest {
            Util.shared.isGuest = false
            SceneDelegate.shared?.checkUserLoggedIn()
        } else {
            let vc = UIStoryboard.storyBoard(withName: .profile).loadViewController(withIdentifier: .profileVC)
            self.show(vc, sender: self)
        }
    }
    
    @IBAction func barcodeTap(_ sender: Any) {
        
    }
    
    @IBAction func loginTap(_ sender: Any) {
        Util.shared.isGuest = false
        SceneDelegate.shared?.checkUserLoggedIn()
    }
    

}
