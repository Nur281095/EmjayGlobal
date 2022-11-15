//
//  SignupIDVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit
import SwiftyJSON
import DropDown

class SignupIDVC: BaseVC {
    
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var cPassTxt: UITextField!
    
    @IBOutlet weak var secQtxt: UITextField!
    
    @IBOutlet weak var secAnsTxt: UITextField!
    @IBOutlet weak var termChkBtn: UIButton!
    @IBOutlet weak var infoChkBtn: UIButton!
    
    var secretQs = [CountryModel]()
    var secQID = ""
    var isTermChk = false
    var isInfoChk = false
    
    var dic = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getSecQs()
    }
    
    func getSecQs() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getSecretQuestion") { response in
            Util.shared.hideSpinner()
            print(response)
            if let data = response["data"] as? [[String: AnyObject]] {
                for d in data {
                    self.secretQs.append(CountryModel(fromDictionary: d))
                }
            }
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
    
    @IBAction func crossTap(_ sender: Any) {
        self.goBack()
    }
    @IBAction func secQTapo(_ sender: UIButton) {
        let dropDown = DropDown()
        dropDown.dataSource = secretQs.map({$0.question!})
        
        dropDown.anchorView = sender
        dropDown.cellHeight = 51
        
        dropDown.setupCornerRadius(8)
        dropDown.textColor = .black
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)! + 10)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)! - 10)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            secQtxt.text = item
            secQID = secretQs[index].id
        }
       
        dropDown.width = sender.frame.width
        dropDown.direction = .any
        dropDown.show()
    }
    
    @IBAction func termsChkTap(_ sender: Any) {
        termChkBtn.setImage(UIImage(named: isTermChk ? "ic_checkbox" : "ic_checkbox_filled"), for: .normal)
        isTermChk = !isTermChk
    }
    
    @IBAction func infoChkTap(_ sender: Any) {
        infoChkBtn.setImage(UIImage(named: isInfoChk ? "ic_checkbox" : "ic_checkbox_filled"), for: .normal)
        isInfoChk = !isInfoChk
    }
    
    @IBAction func continueTap(_ sender: Any) {
        
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
        
        let secQValid = Validator.validateString(text: secQtxt.text, type: "Secret question")
        if !secQValid.0 {
            print(secQValid.1)
            self.showTool(msg: secQValid.1, state: .error)
            return
        }
        let secAValid = Validator.validateString(text: secAnsTxt.text, type: "Secret answer")
        if !secAValid.0 {
            print(secAValid.1)
            self.showTool(msg: secAValid.1, state: .error)
            return
        }
        
        dic["password"] = passTxt.text as AnyObject
        dic["devicetype"] = "ios" as AnyObject
        dic["device_id"] = UIDevice.current.identifierForVendor?.uuidString as AnyObject
        dic["secret_qestion_id"] = secQID as AnyObject
        dic["answer"] = secAnsTxt.text as AnyObject
        
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: dic, method: "signup") { response in
            Util.shared.hideSpinner()
            print(response)
            DispatchQueue.main.async {
                let json = JSON(response)
                if let status = json["status"].int {
                    if status == 200 {
                        self.showTool(msg: json["message"].string ?? "", state: .success)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            SceneDelegate.shared?.checkUserLoggedIn()
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
