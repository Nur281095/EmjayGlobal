//
//  LoginVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit
import AAExtensions
import SwiftyJSON

class LoginVC: BaseVC {

    @IBOutlet weak var userIDTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    @IBOutlet weak var crossBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    @IBAction func crossTap(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func emailSwitchChanged(_ sender: UISwitch) {
        
    }
    @IBAction func forgotPassTap(_ sender: Any) {

    }
    @IBAction func signupTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .signupVC) as! SignupVC
        self.show(vc, sender: self)
    }
    
    @IBAction func biometricTap(_ sender: Any) {
        
    }
    
    @IBAction func loginTap(_ sender: Any) {
        let emailValid = Validator.validateString(text: userIDTxt.text, type: "Email")
        if !emailValid.0 {
            print(emailValid.1)
            self.showTool(msg: emailValid.1, state: .error)
            return
        }
        
        let passValid = Validator.validateString(text: passTxt.text, type: "Password")
        if !passValid.0 {
            print(passValid.1)
            self.showTool(msg: passValid.1, state: .error)
            return
        }
        
        var dic = Dictionary<String, AnyObject>()
        dic["email"] = userIDTxt.text as AnyObject
        dic["password"] = passTxt.text as AnyObject
        dic["devicetype"] = "ios" as AnyObject
        dic["device_id"] = UIDevice.current.identifierForVendor?.uuidString as AnyObject
        dic["social_type"] = "normal" as AnyObject
        
        print(dic)
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: dic, method: "login") { response in
            Util.shared.hideSpinner()
            print(response)
            DispatchQueue.main.async {
                let json = JSON(response)
                if let status = json["status"].int {
                    if status == 200 {
                        
                        if let user = json["user"].dictionaryObject {
                            if let usrStr = user.aa_json {
                                UserDefaults.standard.set(usrStr, forKey: "user")
                                SceneDelegate.shared?.checkUserLoggedIn()
                            }
                        }
                        
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
