//
//  TableViewDOB.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit

class TableViewDOB: UITableViewCell {

    @IBOutlet weak var calenderBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        calenderBtn.layer.cornerRadius = 5
//        calenderBtn.layer.borderWidth = 1
//        calenderBtn.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
