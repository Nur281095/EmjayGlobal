//
//  InvoiceCell.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit
import StyledString

class InvoiceCell: UITableViewCell {
    
    @IBOutlet weak var invPrice: UILabel!
    @IBOutlet weak var invDate: UILabel!
    @IBOutlet weak var invNum: UILabel!
    @IBOutlet weak var orngV: UIView!
    @IBOutlet weak var shadV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model: OpenInvoice) {
        setInvNum(str1: model.orderNo)
        setAmount(str1: model.amount)
        setDate(str1: model.dueDate)
    }
    func setInvNum(str1: String) {
        let str = StyledString("Inovice number: ").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_medium, size: 12)) + StyledString(str1).with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_bold, size: 12))
        invNum.attributedText = str.nsAttributedString
    }
    func setAmount(str1: String) {
        let str = StyledString("AMT: ").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto, size: 12)) + StyledString("USD \(str1)").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_medium, size: 12))
        invPrice.attributedText = str.nsAttributedString
    }
    
    func setDate(str1: String) {
        let str = StyledString("Date: ").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto, size: 12)) + StyledString("\(str1)").with(foregroundColor: UIColor.black).with(font: UIFont(name: AppFonts.roboto_medium, size: 12))
        invDate.attributedText = str.nsAttributedString
    }
}
