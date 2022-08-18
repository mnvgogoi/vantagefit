//
//  ProfileViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 17/08/22.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //user info
        if let currentUser = Auth.auth().currentUser{
            print(currentUser.displayName)
            print(currentUser.email)
            
            //*
            let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
            let fullName = user.profile.name
            let email = user.profile.email
    //        if user.profile.hasImage {
    //            let userDP = user.profile.imageURL(withDimension: 200)
    //            self.sampleImageView.sd_setImage(with: userDP, placeholderImage: UIImage(named: “default-profile”))
    //        } else {
    //            self.sampleImageView.image = UIImage(named: “default-profile”)
    //        }
        }

    }
    
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
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
