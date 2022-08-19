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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


