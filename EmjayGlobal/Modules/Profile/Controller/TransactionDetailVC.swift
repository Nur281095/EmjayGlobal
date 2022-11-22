//
//  TransactionDetailVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit
import AAExtensions

class TransactionDetailVC: BaseVC, UINavigationControllerDelegate {

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
    
    @IBOutlet weak var ssView: UIView!
    
    var trans: TransactionModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = btnBack(isOrignal: true)
        self.navigationItem.title = "\(trans.consigneeName ?? "") - \(trans.consigneeAddress ?? "")"
        setupWhiteNav()
        
        shadV.addShadow(5, .lightGray)
        setData()
    }
    
    func setData() {
        date1.text = trans.departureDate
        date2.text = trans.arrivalDate
        transitTime.text = trans.trnasitTime
        freight.text = "USD \(String(describing: trans.amount!))"
        total.text = "USD \(String(describing: trans.amount!))"
        address.text = "\(trans.consigneeName ?? "") - \(trans.consigneeAddress ?? "")"
        dateNtime.text
        = Date().aa_toString(fromFormat: "dd MMM yyyy, hh:mm a", currentTimeZone: true)
        id.text = "#\(trans.trackNumber ?? "")"
        from.text = trans.shipmentFrom
        to.text = trans.shipmentTo
        if let url = URL(string: trans.qrImage) {
            qrCode.setImageWith(url)
        }
        
    }
    
    @IBAction func downloadTap(_ sender: Any) {
        let ss = ssView.takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(ss, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            showAlertWith(title: "Save error", message: error.localizedDescription)
        } else {
            showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
        }
    }
    
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    @IBAction func shareTap(_ sender: Any) {
        let ss = ssView.takeScreenshot()
        // set up activity view controller
        let imageToShare = [ ss ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = []
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
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
