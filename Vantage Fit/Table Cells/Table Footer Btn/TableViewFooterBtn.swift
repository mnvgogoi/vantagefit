//
//  TableViewFooterBtn.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit


class TableViewFooterBtn: UITableViewCell {

    @IBOutlet weak var continueBtn: UIButton!
    
    var userVitals = UserVitals.sharedInstance
    lazy var validator = Validator()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let btnText = HomeViewControllerStrings.continueBtnString.rawValue.localize()
        self.continueBtn.setTitle(btnText, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if(validator.areUserVitalsEmpty(userVitals)){
            userVitals.pushToFirestore(userVitals)
        }
    }
    
    
    
}
