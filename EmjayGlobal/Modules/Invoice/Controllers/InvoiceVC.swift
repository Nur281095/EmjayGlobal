//
//  InvoiceVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit
import SwiftyJSON
import StyledString

class InvoiceVC: BaseVC {
    
    @IBOutlet weak var tblV: UITableView!
    @IBOutlet weak var topBtnSelectionVLEad: NSLayoutConstraint!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var graphImg: UIImageView!
    
    var invoce: InvoiceModel?
    enum InvoiceType {
        case open
        case paid
    }
    
    var invTyp = InvoiceType.open
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Invoices"
        setupWhiteNav()
        graphImg.isHidden = true
        getInvoices()
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
    
    func getInvoices() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getInvoices") { response in
            Util.shared.hideSpinner()
            print(response)
            if let res = response as? [String : Any] {
                self.invoce = InvoiceModel(fromDictionary: res)
                self.setData()
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
    
    func setData() {
        graphImg.isHidden = false
        setAmount(str1: invoce!.totalAmount, str2: invoce!.openCount)
    }
    
    func setAmount(str1: Int, str2: Int) {
        let str = StyledString("Amount\n\n").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_medium, size: 12)) + StyledString("$\(str1)\n\n").with(foregroundColor: UIColor(hexString: "#28769A")).with(font: UIFont(name: AppFonts.roboto_medium, size: 12)) + StyledString("Open invoices\n").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_medium, size: 12)) + StyledString("\(str2)").with(foregroundColor: UIColor(hexString: "#28769A")).with(font: UIFont(name: AppFonts.roboto_medium, size: 12))
        amount.attributedText = str.nsAttributedString
    }
    
    @IBAction func openTap(_ sender: Any) {
        invTyp = .open
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            self.topBtnSelectionVLEad.constant = 0
        }
        self.tblV.reloadData()
    }
    
    @IBAction func paidTap(_ sender: Any) {
        invTyp = .paid
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            self.topBtnSelectionVLEad.constant = self.view.frame.width * 0.5
        }
        self.tblV.reloadData()
    }

}

extension InvoiceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if invoce == nil {
            return 0
        }
        return invTyp == .open ? invoce!.openInvoices.count : invoce!.paidInvoices.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceCell") as! InvoiceCell
        DispatchQueue.main.async {
            cell.shadV.addShadow(5, .lightGray)
            cell.orngV.aa_roundCorners(topLeft: true, topRight: false, bottomLeft: true, bottomRight: false, strokeColor: nil, lineWidth: 0, radius: 5)
        }
        cell.configCell(model: invTyp == .open ? invoce!.openInvoices[indexPath.row] : invoce!.paidInvoices[indexPath.row])
        
        return cell
    }
}
