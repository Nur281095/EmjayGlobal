//
//  TransactionCell.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 16/11/2022.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var shadV: UIView!
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var transitTime: UILabel!
    @IBOutlet weak var freight: UILabel!
    @IBOutlet weak var total: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model: TransactionModel) {
        date1.text = model.departureDate
        date2.text = model.arrivalDate
        transitTime.text = model.trnasitTime
        freight.text = "USD \(String(describing: model.amount!))"
        total.text = "USD \(String(describing: model.amount!))"
    }
}
