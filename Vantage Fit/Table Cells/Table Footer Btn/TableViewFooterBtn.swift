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
        print("----------")
        print(UserVitals.userVitalsInstance?.gender ?? "defalut gender")
        print(UserVitals.userVitalsInstance?.dateOfBirth ?? "defalut dob")
        print(UserVitals.userVitalsInstance?.height ?? "defalut height")
        print(UserVitals.userVitalsInstance?.weight ?? "defalut weight")
        
        print(UserVitals.userVitalsInstance?.weightUnit ?? "def weight unit")
        print(UserVitals.userVitalsInstance?.heightUnit ?? "def height unit")
    }
    
}
