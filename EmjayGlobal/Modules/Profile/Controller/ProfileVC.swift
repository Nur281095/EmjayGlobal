//
//  ProfileVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit

class ProfileVC: BaseVC {
    
    @IBOutlet weak var shadV: UIView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet var shadViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.title = "Profile"
        setupWhiteNav()
        setupViews()
    }
    
    func setupViews() {
        //        DispatchQueue.main.async {
        shadV.addShadow(5, .lightGray)
        for view in shadViews {
            view.addShadow(5, .lightGray)
        }
//    }
    }
    
    @IBAction func loginTostart(_ sender: Any) {
        
    }
    @IBAction func settBtnTap(_ sender: UIButton) {
        if sender.tag == 0 {
            //Transaction History
            let vc = UIStoryboard.storyBoard(withName: .profile).loadViewController(withIdentifier: .transactionHistoryVC)
            self.show(vc, sender: true)
        } else if sender.tag == 1 {
            //Notifications
            
        } else if sender.tag == 2 {
            //Support
            
        } else if sender.tag == 3 {
            //Terms & conditions
            
        } else if sender.tag == 4 {
            //Logout
        }
    }
    
    
}
