//
//  OverviewCell.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 10/11/2022.
//

import UIKit

class OverviewCell: UITableViewCell {
    
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var city1: UILabel!
    @IBOutlet weak var city2: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}