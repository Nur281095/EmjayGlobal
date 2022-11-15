//
//  WelcomeVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 08/11/2022.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .signupVC) as! SignupVC
        self.show(vc, sender: self)
    }
    
    @IBAction func login(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .loginVC) as! LoginVC
        self.show(vc, sender: self)
    }
    
    @IBAction func guestTap(_ sender: Any) {
    }
    
}
