//
//  TermsAcceptVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 08/11/2022.
//

import UIKit
import Atributika

class TermsAcceptVC: BaseVC {

    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var termV: AttributedLabel!
    
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        checkBtn.setTitle("", for: .normal)
        setupTermsLbl()
    }
    
    func setupTermsLbl(){
        termV.numberOfLines = 0
        termV.textAlignment = .left
        
        let all = Style.font(UIFont(name: AppFonts.roboto, size: 14)!).foregroundColor(UIColor(hexString: "#000000"))
        let link = Style("a").foregroundColor(UIColor(hexString: "#28769A"), .normal).foregroundColor(UIColor(hexString: "#28769A"), .highlighted)

        termV.attributedText = "You read, understand and agree to be bound by the <a href=\"https://www.google.com/\">Shipx.comTerms of Use.</a> You also understand how <a href=\"https://www.google.com/\">Shipx®</a> intends to use your information. <a href=\"https://www.google.com/\">Privacy Policy.</a>."
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
    
    @IBAction func checkTap(_ sender: Any) {
        checkBtn.setImage(UIImage(named: isChecked ? "ic_checkbox" : "ic_checkbox_filled"), for: .normal)
        isChecked = !isChecked
    }
    
    @IBAction func acceptTap(_ sender: Any) {
        if !isChecked {
            self.showTool(msg: "Please accept our terms & conditions to proceed.", state: .warning)
            return
        }
        Util.shared.isTerm = true
        KEYS.saveTerms(shown: true)
        let vc = UIStoryboard.storyBoard(withName: .auth).loadViewController(withIdentifier: .welcomeVC) as! WelcomeVC
        self.show(vc, sender: self)
    }


}
