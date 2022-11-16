//
//  TrackVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit
import SwiftyJSON

class TrackVC: BaseVC {

    @IBOutlet weak var tblV: UITableView!
    @IBOutlet weak var barCodeBtn: UIButton!
    @IBOutlet weak var search: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Tracking"
        setupWhiteNav()
//        getTrackings()
    }
    
    func getTrackings() {
        Util.shared.showSpinner()
        ALF.shared.doPostData(parameters: [:], method: "trackShipment") { response in
            Util.shared.hideSpinner()
            print(response)
            let json = JSON(response)
            if let status = json["status"].int {
                if status == 200 {
                    
                    if let data = response["data"] as? [[String: Any]] {
                        for d in data {
//                            self.ships.append(ShipmentModel(fromDictionary: d))
                        }
                    }
//                    self.tblV.reloadData()
                }
            }
//            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }

    @IBAction func barcodeTap(_ sender: Any) {
    }
}

extension TrackVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackCell
        if indexPath.row % 2 != 0 {
            cell.contentView.backgroundColor = UIColor.white
        } else {
            cell.contentView.backgroundColor = UIColor(hexString: "#F2F2F2")
        }
//        cell.configCell(model: invTyp == .open ? invoce!.openInvoices[indexPath.row] : invoce!.paidInvoices[indexPath.row])
        
        return cell
    }
}
