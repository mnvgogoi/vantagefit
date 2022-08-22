//
//  TableViewHeader.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit
import FirebaseAuth

class TableViewHeader: UITableViewCell {

    @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let currentUser = Auth.auth().currentUser{
            topLabel.text = "Let’s setup your data, \(currentUser.displayName ?? "User")"
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
