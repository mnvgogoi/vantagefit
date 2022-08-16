//
//  TableViewFooterBtn.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit

class TableViewFooterBtn: UITableViewCell {

    @IBOutlet weak var continueBtn: UIButton!
    
    var userVitals = UserVitals.getUserVitalsInstance()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        print("----------")
//        print(userVitals.gender ?? "defalut gender")
//        print(userVitals.dateOfBirth ?? "defalut dob")
//        print(userVitals.height ?? "defalut height")
//        print(userVitals.weight ?? "defalut weight")
//
//        print(userVitals.weightUnit ?? "def weight unit")
//        print(userVitals.heightUnit ?? "def height unit")
        
        
    }
    
}
