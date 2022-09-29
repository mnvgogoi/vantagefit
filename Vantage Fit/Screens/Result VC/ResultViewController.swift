//
//  ResultViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 16/08/22.
//

import UIKit
import FirebaseAuth

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
    @IBOutlet weak var editVitalsBtnLabel : UIButton!
    @IBOutlet weak var userNameLabel : UILabel!
    
    
    
    var userVitals = UserVitals.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dobLabel.text = ResultViewControllerStrings.dobString.rawValue.localize()
        self.genderLabel.text = ResultViewControllerStrings.genderString.rawValue.localize()
        self.heightLabel.text = ResultViewControllerStrings.heightString.rawValue.localize()
        self.weightLabel.text = ResultViewControllerStrings.weightString.rawValue.localize()
        self.editVitalsBtnLabel.setTitle(ResultViewControllerStrings.editVitalsBtnString.rawValue.localize(), for: .normal)
        backgroundCard.layer.cornerRadius = 20
        navigationItem.hidesBackButton = true
        
        if let currentUser = Auth.auth().currentUser{
            self.welcomeLabel.text = ResultViewControllerStrings.headerString.rawValue.localize() + ", "
            self.userNameLabel.text = currentUser.displayName ?? ""
        }
        
        dobValueLabel.text = "\(userVitals.dateOfBirthValue ?? ResultViewControllerStrings.dobFormatString.rawValue)"

        genderValuelabel.text = "\(userVitals.gender ?? Gender.Unspecified)"
        heightValueLabel.text = "\(userVitals.heightDisplayValue ?? "0 cm")"
        weightValueLabel.text = "\(userVitals.weightDisplayValue ?? "0 kg")"
        
    }

    
    @IBAction func editUserVitalsBtnTapped(_ sender : UIButton){
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}


