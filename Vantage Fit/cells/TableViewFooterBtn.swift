//
//  TableViewFooterBtn.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit

class TableViewFooterBtn: UITableViewCell {

    @IBOutlet weak var continueBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
 
    }
    
}