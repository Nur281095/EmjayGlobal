//
//  ChangePasswordVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 29/09/2022.
//

import UIKit
import AAExtensions
import SwiftyJSON

class ChangePasswordVC: BaseVC {
    
    @IBOutlet weak var oldPass: UITextField!
    @IBOutlet weak var newPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationController?.isNavigationBarHidden = false
        self.setupWhiteNav()
    }
    
    @IBAction func eyeTap(_ sender: UIButton) {
        if sender.tag == 0 {
            oldPass.isSecureTextEntry = !oldPass.isSecureTextEntry
        } else {
            newPass.isSecureTextEntry = !newPass.isSecureTextEntry
        }
    }
    
    @IBAction func updatePassTap(_ sender: Any) {
        let oldPassValid = Validator.validateString(text: oldPass.text, type: "Old Password")
        if !oldPassValid.0 {
            print(oldPassValid.1)
            self.showTool(msg: oldPassValid.1, state: .error)
            return
        }
        let newPassValid = Validator.validatePassword(text: newPass.text)
        if !newPassValid.0 {
            print(newPassValid.1)
            self.showTool(msg: newPassValid.1, state: .error)
            return
        }
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: [:], method: "user/change-password") { response in
            Util.shared.hideSpinner()
            print(response)
            DispatchQueue.main.async {
                let json = JSON(response)
                if let status = json["status"].int {
                    if status == 200 {
                        self.showTool(msg: json["message"].string ?? "", state: .success)
                        self.goBackWithDelay()
                    } else {
                        self.showTool(msg: json["message"].string ?? "", state: .error)
                    }
                }
            }
            
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }
    }
    

}
