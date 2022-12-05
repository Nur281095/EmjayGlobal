//
//  NormalShipVC.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 30/11/2022.
//

import UIKit
import SwiftyJSON
import AAExtensions

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
    lazy var imagePicker = ImagePicker()
    
    enum PhotoTag {
        case zero
        case one
        case two
        case three
    }
    
    var photoTg = PhotoTag.zero
    var itemsUploaded = [String]()

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
    
    @IBAction func addItemImg(_ sender: UIButton) {
        self.resignAll()
        if sender.tag == 0 {
            photoTg = .zero
        } else if sender.tag == 1 {
            photoTg = .one
        } else if sender.tag == 2 {
            photoTg = .two
        } else if sender.tag == 3 {
            photoTg = .three
        }
        
        imagePicker.delegate = self
        let alertVC = UIAlertController(title: "UON",
                                        message: "Please select source",
                                        preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.present(parent: self, sourceType: .camera)
            }
        }))
        alertVC.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
            self.imagePicker.present(parent: self, sourceType: .photoLibrary)
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
        }))
        self.present(alertVC, animated: true, completion: nil)
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
        
        var params = [String: AnyObject]()
        
        if shiperName.aa_isEmpty {
            self.showTool(msg: "Shipper’s name is required", state: .warning)
            return
        }
        if shipAddress.aa_isEmpty {
            self.showTool(msg: "Shipper’s address is required", state: .warning)
            return
        }
        if ((shipState.text?.isEmpty) != nil) {
            self.showTool(msg: "State/province is required", state: .warning)
            return
        }
        if conName.aa_isEmpty {
            self.showTool(msg: "Consignee’s name is required", state: .warning)
            return
        }
        if conAddress.aa_isEmpty {
            self.showTool(msg: "Consignee’s address is required", state: .warning)
            return
        }
        if ((conState.text?.isEmpty) != nil) {
            self.showTool(msg: "Shipper’s State/province is required", state: .warning)
            return
        }
        if phone.aa_isEmpty {
            self.showTool(msg: "Consignee’s Phone is required", state: .warning)
            return
        }
        
        params["file"] = itemsUploaded.joined(separator: ",") as AnyObject
        params["shipper_name"] = shiperName.text as AnyObject
        params["shipment_type"] = "" as AnyObject
        params["shipper_phone"] = "" as AnyObject
        params["shipper_address"] = "" as AnyObject
        params["shipper_state"] = "" as AnyObject
        params["shipper_city"] = "" as AnyObject
        params["request_pickup"] = "" as AnyObject
        params["pickup_location"] = "" as AnyObject
        params["request_insurance"] = "" as AnyObject
        params["delivery_type"] = "" as AnyObject
        params["consignee_name"] = "" as AnyObject
        params["consignee_address"] = "" as AnyObject
        params["consignee_phone"] = "" as AnyObject
        params["item_description"] = "" as AnyObject
        params["consignee_country"] = "" as AnyObject
        params["consignee_state"] = "" as AnyObject
        params["consignee_city"] = "" as AnyObject
        params["quantity"] = "" as AnyObject
        params["length"] = "" as AnyObject
        params["width"] = "" as AnyObject
        params["height"] = "" as AnyObject
        params["package_type"] = "" as AnyObject
        params["package_weight"] = "" as AnyObject
        params["carriage_value"] = "" as AnyObject
        params["shipment_from"] = "" as AnyObject
        params["shipment_to"] = "" as AnyObject
        params["shipment_date"] = "" as AnyObject
        
    }
    

}

extension NormalShipVC: ImagePickerDelegate {
    
    // MARK: - imagePickerDelegate
    func imagePickerDelegate(canUseCamera accessIsAllowed: Bool, delegatedForm: ImagePicker) {
        
    }
    
    func imagePickerDelegate(canUseGallery accessIsAllowed: Bool, delegatedForm: ImagePicker) {
        
    }
    func imagePickerDelegate(didSelect image: UIImage, delegatedForm: ImagePicker) {
        
        self.imagePicker.dismiss()
        var tag = -1
        if photoTg == .one {
            tag = 1
        } else if photoTg == .two {
            tag = 2
        } else if photoTg == .three {
            tag = 3
        } else if photoTg == .zero {
            tag = 0
        }
        for img in itemImgs {
            if img.tag == tag {
                img.image = image
            }
        }
        
        self.uploadFile(file: image, name: generateCurrentTimeStamp())
    }
    
    func imagePickerDelegate(didCancel delegatedForm: ImagePicker) {
        self.imagePicker.dismiss()
    }
    
    func generateCurrentTimeStamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    func uploadFile(file: UIImage, name: String) {
        Util.shared.showSpinner()
        ALF.shared.doPostDataWithImage(parameters: [:], method: "upload_file", image: file, fileName: "name") { response in
            Util.shared.hideSpinner()
            print(response)
            DispatchQueue.main.async {
                let json = JSON(response)
                if let status = json["status_code"].int {
                    if status == 200 {
                        self.itemsUploaded.append(json["file"].stringValue)
                        self.showTool(msg: json["message"].string ?? "file added successfully", state: .success)
                    } else {
                        self.showTool(msg: json["message"].string ?? "", state: .error)
                    }
                }
            }
            
        } fail: { response in
            Util.shared.hideSpinner()
            DispatchQueue.main.async {
                self.showTool(msg: response as? String ?? "Error", state: .error)
            }
        }

    }
}
