//
//  ResultViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 16/08/22.
//

import UIKit

class ResultViewController: BaseViewController {

    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobValueLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderValuelabel: UILabel!
    
    
    
    var userVitals = UserVitals.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundCard.layer.cornerRadius = 20
        
        dobValueLabel.text = "\(userVitals.dateOfBirth ?? "dd-mm-yyyy")"

        genderValuelabel.text = "\(userVitals.gender ?? Gender.Unspecified)"
        heightValueLabel.text = "\(userVitals.heightDisplayValue ?? "0 cm")"
        weightValueLabel.text = "\(userVitals.weightDisplayValue ?? "0 kg")"
    }


}
