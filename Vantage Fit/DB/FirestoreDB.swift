//
//  FirestoreDB.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 22/08/22.
//

import Foundation
import FirebaseFirestore

class FirestoreDB{
    
    static let firestoreDBSharedInstance = Firestore.firestore()
    
    private init(){}
}


enum DocumentBodyLabels:String {
    case userEmail,userData,userVitals
}

struct UserVitalsData : Codable{
    let gender : Gender?
    let dateOfBirth : String?
    let weight : Double?
    let height : Double?
}
