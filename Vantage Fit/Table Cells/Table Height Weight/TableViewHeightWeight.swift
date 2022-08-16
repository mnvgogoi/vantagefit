//
//  TableViewHeightWeight.swift  --> SLiderVC
//

import UIKit

class TableViewHeightWeight: UITableViewCell {

    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var backgroundCardWeight: UIView!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    
    let weightVC = WeightViewController()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCard.layer.cornerRadius = 25
        backgroundCardWeight.layer.cornerRadius = 25
        
        //*
        weightVC.delegate = self
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: -

extension TableViewHeightWeight: cardLabelChangeProtocol {
    func changeLabel(_ data: String) {
        print("changed")
        weightValue.text = data
    }
    
}
