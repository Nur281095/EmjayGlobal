//
//  TrackVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit
import SwiftyJSON
import BarcodeScanner

class TrackVC: BaseVC, BarcodeScannerCodeDelegate, BarcodeScannerDismissalDelegate {

    @IBOutlet weak var tblV: UITableView!
    @IBOutlet weak var barCodeBtn: UIButton!
    @IBOutlet weak var search: UITextField!
    
    var tracknumber = ""
    var searches = [RecentSearch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Tracking"
        setupWhiteNav()
        if tracknumber != "" {
            getTrackings(trackNum: tracknumber)
        } else {
            search.becomeFirstResponder()
        }
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
    func getTrackings(trackNum: String) {
        self.searches.removeAll()
        self.tblV.reloadData()
        Util.shared.showSpinner()
        var dic = [String: AnyObject]()
        dic["track_number"] = trackNum as AnyObject
        ALF.shared.doPostData(parameters: dic, method: "trackShipment") { response in
            Util.shared.hideSpinner()
            print(response)
            let json = JSON(response)
            if let status = json["status"].int {
                if status == 200 {
                    
                    if let data = response["data"] as? [[String: Any]] {
                        for d in data {
                            self.searches.append(RecentSearch(fromDictionary: d))
                        }
                    }
                }
            }
            self.tblV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }

    @IBAction func barcodeTap(_ sender: Any) {
        search.resignFirstResponder()
        search.text = ""
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.dismissalDelegate = self
        self.showDetailViewController(viewController, sender: self)
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        search.text = code
        controller.reset()
        controller.dismiss(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.getTrackings(trackNum: code)
        }
        
    }
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension TrackVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        getTrackings(trackNum: textField.text ?? "")
        
        return true
    }
}

extension TrackVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackCell
        if indexPath.row % 2 != 0 {
            cell.contentView.backgroundColor = UIColor.white
        } else {
            cell.contentView.backgroundColor = UIColor(hexString: "#F2F2F2")
        }
        cell.configCell(model: searches[indexPath.row])
        
        return cell
    }
}
