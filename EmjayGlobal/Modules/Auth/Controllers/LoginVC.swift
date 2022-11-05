//
//  LoginVC.swift
//  EyecareBrands
//
//  Created by Naveed ur Rehman on 26/08/2022.
//

import UIKit
import Atributika
import AAExtensions
import SwiftyJSON

class LoginVC: BaseVC {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var eye: UIImageView!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var forgotPassBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signuoBtn: UIButton!
    @IBOutlet weak var termV: AttributedLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTermsLbl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupTermsLbl(){
        termV.numberOfLines = 0
        termV.textAlignment = .center
        let all = Style.font(UIFont(name: AppFonts.roboto, size: 15)!).foregroundColor(UIColor(hexString: "#999999"))
        let link = Style("a").foregroundColor(UIColor(hexString: "#0E9CEA"), .normal).foregroundColor(UIColor(hexString: "#0E9CEA"), .highlighted)
        
        termV.attributedText = "By signing up you agree to Eyecarebrands\n <a href=\"https://www.google.com/\">Terms of Service</a> and <a href=\"https://www.google.com/\">Privacy Policy</a>."
            .style(tags: link)
            .styleHashtags(link)
            .styleMentions(link)
            .styleLinks(link)
            .styleAll(all)

        termV.onClick = { label, detection in
            switch detection.type {
            case .tag(let tag):
                if tag.name == "a", let href = tag.attributes["href"], let url = URL(string: href) {
                    url.absoluteString.aa_openURL()
                }
            default:
                break
            }
        }
        
            
    }
    
    @IBAction func eyeTap(_ sender: Any) {
        passTxt.isSecureTextEntry = !passTxt.isSecureTextEntry
    }
    
    @IBAction func forgotPassTap(_ sender: Any) {
        "https://www.eyecarebrands.com/login".aa_openURL()
    }
    @IBAction func signInTap(_ sender: Any) {

        let emailValid = Validator.validateString(text: emailTxt.text, type: "Email")
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
        dic["email"] = emailTxt.text as AnyObject
        dic["password"] = passTxt.text as AnyObject
       
        print(dic)
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: dic, method: "login") { response in
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
    @IBAction func signUpTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .signupVC) as! SignupVC
        self.show(vc, sender: self)
    }
  
}
