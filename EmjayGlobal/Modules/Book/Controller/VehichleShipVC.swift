//
//  VehichleShipVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 01/12/2022.
//

import UIKit

class VehichleShipVC: BaseVC {

    @IBOutlet var itemImgs: [UIImageView]!
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var frmPortCity: UITextField!
    
    @IBOutlet weak var toPortCity: UITextField!
    @IBOutlet weak var shipDate: UITextField!
    @IBOutlet weak var vehicleDescrip: UILabel!
    
    @IBOutlet weak var conCode: UITextField!
    @IBOutlet weak var conPhone: UITextField!
    
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
        
    }
    
    @IBAction func addItemImg(_ sender: Any) {
    }
    
    @IBAction func conStateNprovince(_ sender: UIButton) {
    }
    @IBAction func addVehicle(_ sender: UIButton) {
        let vc = UIStoryboard.storyBoard(withName: .book).loadViewController(withIdentifier: .addVehicleVC) as! AddVehicleVC
        self.show(vc, sender: self)
    }
    @IBAction func dateTap(_ sender: UIButton) {
        
    }
    
    
    @IBAction func continueTap(_ sender: UIButton) {
    }
    

}
