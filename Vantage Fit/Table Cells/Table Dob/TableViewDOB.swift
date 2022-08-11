//
//  TableViewDOB.swift   -->    PopUpVC
//

import UIKit

class TableViewDOB: UITableViewCell {
    
    @IBOutlet weak var calenderBtn: UIButton!
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCard.layer.cornerRadius = 25
        
        calenderBtn.layer.cornerRadius = 20
        calenderBtn.layer.borderWidth = 3
        calenderBtn.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
  
}
