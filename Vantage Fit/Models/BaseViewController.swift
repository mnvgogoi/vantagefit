//
//  BaseViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 18/08/22.
//

import UIKit
import FirebaseAuth

class BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        
        //        navigationItem.hidesBackButton = true
        
        //        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutUser))
        //        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "power.circle.fill", withConfiguration: config)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(logoutUser))
        button.tintColor = UIColor(rgb: 0xC23B45)
        self.navigationItem.rightBarButtonItem = button
    }
    
    
    //-- logout function
    
    @objc func logoutUser(){
        print("clicked")
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("logout")
            self.dismiss(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
