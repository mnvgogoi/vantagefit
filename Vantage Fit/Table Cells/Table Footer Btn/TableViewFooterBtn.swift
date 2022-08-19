//
//  TableViewFooterBtn.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn


class TableViewFooterBtn: UITableViewCell {

    @IBOutlet weak var continueBtn: UIButton!
    
    var userVitals = UserVitals.sharedInstance

    let db = Firestore.firestore()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
//        saveToFirestore()
    }
    
    func saveToFirestore(){
       
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func getUser(){
        
        if let currentUser = Auth.auth().currentUser{
            print(currentUser.displayName ?? "no user")
            print(currentUser.email ?? "no email")
            
            //*
//            let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
//            let fullName = user.profile.name
//            let email = user.profile.email
//            print("+++++++")
//            print(fullName)
//            print(email)
        }
    }
    
    
    
}
