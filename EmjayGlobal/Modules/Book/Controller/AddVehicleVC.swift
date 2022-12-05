//
//  AddVehicleVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 01/12/2022.
//

import UIKit

class AddVehicleVC: BaseVC {

    @IBOutlet weak var descrip: UITextField!
    @IBOutlet weak var vinNum: UITextField!
    @IBOutlet weak var vPurchaseCost: UITextField!
    @IBOutlet weak var shipCountry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: false)
        
        self.navigationItem.title = "Add Vehicle"
    }
    
    @IBAction func continueTap(_ sender: Any) {
        
    }

}
