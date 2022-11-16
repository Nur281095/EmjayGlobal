//
//  TrackCell.swift
//  EmjayGlobal
//
//  Created by Naveed ur Rehman on 15/11/2022.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var booking: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var frm: UILabel!
    @IBOutlet weak var to: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
