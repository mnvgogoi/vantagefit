//
//  LoginViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 17/08/22.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleLogin()
    }
    
    @IBAction func googleBtnTapped(_ sender: UIButton) {
        print("google signout BtnTapped")
        //        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBAction func googleSignInPressed(_ sender: GIDSignInButton) {
        print("GIDSignInButton")
        GIDSignIn.sharedInstance().signIn()
    }
    
    func googleLogin(){
        //show prompt
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        if GIDSignIn.sharedInstance().hasPreviousSignIn(){
            GIDSignIn.sharedInstance().restorePreviousSignIn()
            print("Already login")
        }
    }
}

//MARK: - GIDSignInDelegate extensions

extension LoginViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard let userEmail = user.profile.email else {
            return print("no email")
        }

        print("\(userEmail)")
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials)
        {
            (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful")
                
                var view : BaseViewController?
                if(!UserVitals.sharedInstance.pullStatus){
                    view = HomeViewController(nibName: "HomeViewController", bundle: nil)
                }
                if (UserVitals.sharedInstance.pullStatus) {
                    view = ResultViewController(nibName: "ResultViewController", bundle: nil)
                }
                
                self.navigate(view!)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("when google user disconected")
    }
    
}


