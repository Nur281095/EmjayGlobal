//
//  SignupVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit
import AAExtensions
import SwiftyJSON

class SignupVC: BaseVC {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var lNameTxt: UITextField!
    @IBOutlet weak var cPassTxt: UITextField!
        
    @IBOutlet weak var eye: UIImageView!
    @IBOutlet weak var eye1: UIImageView!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var eyeBtn1: UIButton!
    
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signuoBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationController?.isNavigationBarHidden = false
        self.setupWhiteNav()
    }
    
    @IBAction func eyeTap(_ sender: UIButton) {
        if sender.tag == 0 {
            passTxt.isSecureTextEntry = !passTxt.isSecureTextEntry
        } else {
            cPassTxt.isSecureTextEntry = !cPassTxt.isSecureTextEntry
        }
    }
    @IBAction func signInTap(_ sender: Any) {
        self.goBack()
    }
    @IBAction func signUpTap(_ sender: Any) {
        let emailValid = Validator.validateEmail(text: emailTxt.text)
        if !emailValid.0 {
            print(emailValid.1)
            self.showTool(msg: emailValid.1, state: .error)
            return
        }
        
        let fNameValid = Validator.validateString(text: fNameTxt.text, type: "First name")
        if !fNameValid.0 {
            print(fNameValid.1)
            self.showTool(msg: fNameValid.1, state: .error)
            return
        }
        
        let lNameValid = Validator.validateString(text: fNameTxt.text, type: "Last name")
        if !lNameValid.0 {
            print(lNameValid.1)
            self.showTool(msg: lNameValid.1, state: .error)
            return
        }
        
        let passValid = Validator.validatePassword(text: passTxt.text)
        if !passValid.0 {
            print(passValid.1)
            self.showTool(msg: passValid.1, state: .error)
            return
        }
        
       
        if passTxt.text != cPassTxt.text {
            
            self.showTool(msg: "Password doesn't match.", state: .error)
            return
        }
        
        var dic = Dictionary<String, AnyObject>()
        dic["first_name"] = fNameTxt.text as AnyObject
        dic["last_name"] = lNameTxt.text as AnyObject
        dic["email"] = emailTxt.text as AnyObject
        dic["password"] = passTxt.text as AnyObject
        dic["password_confirmation"] = cPassTxt.text as AnyObject
        
        print(dic)
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: dic, method: "register") { response in
            Util.shared.hideSpinner()
            print(response)
            DispatchQueue.main.async {
                let json = JSON(response)
                if let status = json["status"].int {
                    if status == 200 {
                        
                        if var user = json["data"]["user"].dictionaryObject {
                            user["token"] = json["data"]["token"].stringValue
                            if let usrStr = user.aa_json {
                                DispatchQueue.main.async {
                                    UserDefaults.standard.set(usrStr, forKey: "user")
                                    
                                    SceneDelegate.shared?.checkUserLoggedIn()
                                }
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
