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
    
    
    
    var userVitals = UserVitals.sharedInstance
    
   var myFloatingBtn = FloatingButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundCard.layer.cornerRadius = 20
        navigationItem.hidesBackButton = true
        
        if let currentUser = Auth.auth().currentUser{
            welcomeLabel.text = "Welcome, \(currentUser.displayName ?? "User")"
        }
        
        dobValueLabel.text = "\(userVitals.dateOfBirth ?? "dd-mm-yyyy")"

        genderValuelabel.text = "\(userVitals.gender ?? Gender.Unspecified)"
        heightValueLabel.text = "\(userVitals.heightDisplayValue ?? "0 cm")"
        weightValueLabel.text = "\(userVitals.weightDisplayValue ?? "0 kg")"
        myFloatingBtn.floatingButton()
        myFloatingBtn.btn.addTarget(self,action: #selector(self.goToTableViewController), for: .touchUpInside)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        myFloatingBtn.btn.removeFromSuperview()
    }
    
    @objc func goToTableViewController(_ button: UIButton) {
        print("button tapped")
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}


