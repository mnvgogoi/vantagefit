//
//  TableViewHeightWeight.swift  --> SLiderVC
//

import UIKit

class TableViewHeightWeight: UITableViewCell {

    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var backgroundCardWeight: UIView!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightLabel : UILabel!
    @IBOutlet weak var weightLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCard.layer.cornerRadius = 25
        backgroundCardWeight.layer.cornerRadius = 25
        self.heightLabel.text = HomeViewControllerStrings.heightString.rawValue.localize()
        self.weightLabel.text = HomeViewControllerStrings.weightString.rawValue.localize()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(heightValue:String?, weightValue:String?) {
        self.heightValue.text = heightValue
        self.weightValue.text = weightValue
    }
    
}


