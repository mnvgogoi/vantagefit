//
//  HomeViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 17/08/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var manualDataInsertBtn: UIButton!
    @IBOutlet weak var autoInsertDataBtn : UIButton!
    @IBOutlet weak var separatorLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manualDataInsertBtn.setTitle(WelcomeControllerStrings.manualDataFetchBtnString.rawValue.localize(), for: .normal)
        self.manualDataInsertBtn.layer.cornerRadius = 15
        let manualBtnWidthAnchor = manualDataInsertBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100)
        manualBtnWidthAnchor.isActive = true
        self.autoInsertDataBtn.setTitle(WelcomeControllerStrings.autoFetchDataBtnString.rawValue.localize(), for: .normal)
        self.autoInsertDataBtn.layer.cornerRadius = 15
        let autoBtnWithAnchor = autoInsertDataBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor,constant: -100)
        autoBtnWithAnchor.isActive = true
        self.separatorLabel.text = WelcomeControllerStrings.separatorString.rawValue.localize()
                navigationItem.hidesBackButton = true
        
//        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutUser))
//        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
    }
    
//    @objc func logoutUser(){
//         print("clicked")
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//            print("logout")
//            self.dismiss(animated: true)
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }
//    }
    

    
    @IBAction func manualBtnPressed(_ sender: UIButton) {
        //create instance
        let tableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
        //to present a vc
        //        self.present(tableViewController, animated: true, completion: nil)
        
        //to  navigate into other vc
        if let navigationController = self.navigationController {
            navigationController.pushViewController(tableViewController, animated: true)
        } else {
            print("Navigation controller unavailable!")
        }
        
        
    }
   
}


