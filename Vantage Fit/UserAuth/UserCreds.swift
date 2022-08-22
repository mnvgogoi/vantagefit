//
//  UserCreds.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 22/08/22.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

func getUserEmail() -> String?{
    var userEmail : String?
    if let currentUser = Auth.auth().currentUser{
        userEmail = currentUser.email
    }
    return userEmail
}
