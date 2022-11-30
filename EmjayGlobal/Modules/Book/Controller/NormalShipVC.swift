//
//  NormalShipVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 30/11/2022.
//

import UIKit

class NormalShipVC: BaseVC {
    
    @IBOutlet var itemImgs: [UIImageView]!
    @IBOutlet weak var shiperName: UITextField!
    @IBOutlet weak var shipAddress: UITextField!
    
    @IBOutlet weak var shipState: UILabel!
    @IBOutlet weak var shipProvince: UILabel!
    
    @IBOutlet weak var reqPickChk: CheckBox!
    @IBOutlet weak var reqPickReadMoreBtn: UIButton!
    @IBOutlet weak var locPick: UITextField!
    @IBOutlet weak var reqChk: CheckBox!
    @IBOutlet weak var reqReadMoreBtn: UIButton!
    @IBOutlet weak var homeRadio: CheckBox!
    @IBOutlet weak var lagosRadio: CheckBox!
    @IBOutlet weak var conName: UITextField!
    @IBOutlet weak var conAddress: UITextField!
    @IBOutlet weak var conState: UILabel!
    @IBOutlet weak var conProvince: UILabel!
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var desrcip: UITextField!
    @IBOutlet weak var qty: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var width: UITextField!
    @IBOutlet weak var lenght: UITextField!
    @IBOutlet weak var termLbl: UILabel!
    
    var navTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: false)
        
        self.navigationItem.title = navTitle
        
        homeRadio.borderStyle = .rounded
        homeRadio.style = .circle

        lagosRadio.borderStyle = .rounded
        lagosRadio.style = .circle
        
        reqPickChk.borderStyle = .roundedSquare(radius: 4)
        reqPickChk.style = .tick

        reqChk.borderStyle = .roundedSquare(radius: 4)
        reqChk.style = .tick
        
    }
    
    @IBAction func addItemImg(_ sender: Any) {
    }
    
    @IBAction func shipStateProvince(_ sender: UIButton) {
    }
    @IBAction func readMoreTaps(_ sender: UIButton) {
    }
    
    @IBAction func conStateNprovince(_ sender: UIButton) {
    }
    @IBAction func reqChkTap(_ sender: CheckBox) {
        if sender.tag == 0 {
            reqPickChk.isChecked = !reqPickChk.isChecked
        } else {
            reqChk.isChecked = !reqChk.isChecked
        }
    }
    @IBAction func homeRadioTap(_ sender: CheckBox) {
        if sender.tag == 0 {
            homeRadio.isChecked = !homeRadio.isChecked
        } else {
            lagosRadio.isChecked = !lagosRadio.isChecked
        }
    }
    
    
    @IBAction func continueTap(_ sender: UIButton) {
    }
    

}
