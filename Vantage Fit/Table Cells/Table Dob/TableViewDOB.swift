//
//  TableViewDOB.swift   -->    CalenderVC
//

import UIKit

class TableViewDOB: UITableViewCell {
    
    @IBOutlet weak var calenderBtn: UIButton!
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobValueLabel: UILabel!

    private let calenderVC = CalenderViewController()
    private var userVitals = UserVitals.sharedInstance
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCard.layer.cornerRadius = 25
        
        calenderBtn.layer.cornerRadius = 20
        calenderBtn.layer.borderWidth = 3
        calenderBtn.layer.borderColor = UIColor.white.cgColor
        
        dobValueLabel.text = HomeViewControllerStrings.dobFormatString.rawValue.localize()
        self.dobLabel.text = HomeViewControllerStrings.dobString.rawValue.localize()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func calenderBtnPressed(_ sender: UIButton) {
        print("calender")
    }
    
    func setData(dobValue:String?) {
        self.dobValueLabel.text = dobValue
    }
    
}

