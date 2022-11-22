//
//  ShipVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit
import SwiftyJSON

class ShipVC: BaseVC {

    @IBOutlet weak var tblV: UITableView!
    
    var ships = [ShipmentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Shipments"
        setupWhiteNav()
        tblV.register(UINib(nibName: "OverviewCell", bundle: nil), forCellReuseIdentifier: "OverviewCell")

        getShips()
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
    func getShips() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "getShipments") { response in
            Util.shared.hideSpinner()
            print(response)
            let json = JSON(response)
            if let status = json["status"].int {
                if status == 200 {
                    
                    if let data = response["data"] as? [[String: Any]] {
                        for d in data {
                            self.ships.append(ShipmentModel(fromDictionary: d))
                        }
                    }
                    self.tblV.reloadData()
                }
            }
//            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }

}

extension ShipVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ships.count
//        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewCell") as! OverviewCell
        DispatchQueue.main.async {
            cell.shadV.addShadow(5, .lightGray)
        }
        cell.configCell(model: ships[indexPath.row])
        return cell
    }
}
