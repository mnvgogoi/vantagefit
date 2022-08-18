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
    private var userVitals = UserVitals.getUserVitalsInstance()
    //*
    var delegate: DOBCellToCalenderViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCard.layer.cornerRadius = 25
        
        calenderBtn.layer.cornerRadius = 20
        calenderBtn.layer.borderWidth = 3
        calenderBtn.layer.borderColor = UIColor.white.cgColor
        
        dobValueLabel.text = "dd-mm-yy"
        
        calenderVC.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func calenderBtnPressed(_ sender: UIButton) {
        delegate?.navigateFromDOBCellToCalenderView(calenderVC)
    }
}

//MARK: -

extension TableViewDOB: TableViewDOBCellDelegate{
    
    func didSetDOB() {
        dobValueLabel.text = userVitals.dateOfBirth
    }
    
}
