//
//  TableViewDOB.swift   -->    PopUpVC
//

import UIKit

//protocol CalenderDelegate{
//    func buttonPressed()
//}

class TableViewDOB: UITableViewCell {
    
    @IBOutlet weak var calenderBtn: UIButton!
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobValueLabel: UILabel!
    
//    var delegate: CalenderDelegate?


    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCard.layer.cornerRadius = 25
        
        calenderBtn.layer.cornerRadius = 20
        calenderBtn.layer.borderWidth = 3
        calenderBtn.layer.borderColor = UIColor.white.cgColor
        
        dobValueLabel.text = "dd-mm-yy"
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
  
}
