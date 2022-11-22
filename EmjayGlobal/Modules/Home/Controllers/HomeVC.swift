//
//  HomeVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 09/11/2022.
//

import UIKit
import SwiftyJSON
import BarcodeScanner

class HomeVC: BaseVC, BarcodeScannerCodeDelegate, BarcodeScannerDismissalDelegate {
    
    @IBOutlet weak var barCodeBtn: UIButton!
    @IBOutlet weak var guestV: UIView!
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var colV: UICollectionView!
    @IBOutlet weak var shadV1: UIView!
    @IBOutlet weak var shadV2: UIView!
    @IBOutlet weak var shadV3: UIView!
    
    @IBOutlet weak var startLbl: UILabel!
    
    @IBOutlet weak var openInv: UILabel!
    @IBOutlet weak var paidInv: UILabel!
    @IBOutlet weak var processShips: UILabel!
    @IBOutlet weak var shipShips: UILabel!
    @IBOutlet weak var recieveShips: UILabel!
    @IBOutlet weak var cancelShips: UILabel!
    @IBOutlet weak var searchH: NSLayoutConstraint! //110
    @IBOutlet weak var hideV: UIView!
    
    var home: HomeModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guestV.isHidden = !Util.shared.isGuest
        self.navigationItem.rightBarButtonItem = btnRight(image: "ic_profile", isOrignal: true)
        self.navigationItem.title = "Home"
        setupWhiteNav()
        searchH.constant = 0
        if Util.shared.isGuest {
            hideV.isHidden = true
            startLbl.text = "Start managing your Shipments and logistics"
            guestV.isHidden = false
        } else {
            hideV.isHidden = false
            startLbl.text = "Here is latest with \(Util.getUser()!.name ?? "")"
            guestV.isHidden = true
        }
        getHomeData()
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
    
    func getHomeData() {
        Util.shared.showSpinner()
        ALF.shared.doGetData(parameters: [:], method: "homeData") { response in
            Util.shared.hideSpinner()
            print(response)
            let json = JSON(response)
            if let status = json["status"].int {
                if status == 200 {
                    
                    if let data = response["data"] as? [String: Any] {
                        self.home = HomeModel(fromDictionary: data)
                        self.setdata()
                    }
                }
            }
            self.colV.reloadData()
        } fail: { response in
            Util.shared.hideSpinner()
            print(response)
        }

    }
    
    func setdata() {
        self.hideV.isHidden = true
        shadV1.addShadow(5, .lightGray)
        shadV2.addShadow(5, .lightGray)
        shadV3.addShadow(5, .lightGray)
        openInv.text = "\(home.unpaidInvoiceCount ?? 0)"
        paidInv.text = "\(home.paidInvoiceCount ?? 0)"
        processShips.text = "\(home.processingShipments ?? 0)"
        shipShips.text = "\(home.shippedShipments ?? 0)"
        recieveShips.text = "\(home.receivedShipments ?? 0)"
        cancelShips.text = "\(home.cancelledShipments ?? 0)"
        searchH.constant = home.recentSearch.count == 0 ? 0 : 110
    }
    
    @IBAction func barcodeTap(_ sender: Any) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.dismissalDelegate = self
        self.showDetailViewController(viewController, sender: self)
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        controller.reset()
        controller.dismiss(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let vc = UIStoryboard.storyBoard(withName: .track).loadViewController(withIdentifier: .trackVC) as! TrackVC
            vc.tracknumber = code
            self.show(vc, sender: self)
        }
        
    }
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBAction func searchTap(_ sender: Any) {
        let vc = UIStoryboard.storyBoard(withName: .track).loadViewController(withIdentifier: .trackVC) as! TrackVC
        self.show(vc, sender: self)
    }
    
    @IBAction func allInvTap(_ sender: Any) {
        self.tabBarController?.selectedIndex = 3
    }
    
    @IBAction func loginTap(_ sender: Any) {
        Util.shared.isGuest = false
        SceneDelegate.shared?.checkUserLoggedIn()
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return home == nil ? 0 : home.recentSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 63)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentSearchCell", for: indexPath) as! RecentSearchCell
        let model = home.recentSearch[indexPath.item]
        cell.frm.text = model.shipmentFrom
        cell.to.text = model.shipmentTo
        cell.date.text = model.shipmentDate
        
        DispatchQueue.main.async {
            cell.shadV.addShadow(5, .lightGray)
        }
        return cell
    }
}
