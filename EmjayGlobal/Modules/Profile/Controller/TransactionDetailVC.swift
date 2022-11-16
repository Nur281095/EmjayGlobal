//
//  TransactionDetailVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit

class TransactionDetailVC: BaseVC {

    @IBOutlet weak var shadV: UIView!
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var transitTime: UILabel!
    @IBOutlet weak var freight: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var dateNtime: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var qrCode: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.title = "Barcelona - Dubai"
        setupWhiteNav()
        
        shadV.addShadow(5, .lightGray)
    }
    
    @IBAction func downloadTap(_ sender: Any) {
    }
    
    @IBAction func shareTap(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
