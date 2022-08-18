//
//  UserVitals.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 11/08/22.
//

import Foundation

class UserVitals {
    
    var gender:Gender? {
        get {
            return self.genderValue
        } set(newValue) {
            self.genderValue = newValue
            //push to firebase
        }
    }
    
    private var genderValue  : Gender?
    var dateOfBirth : String?
    var weight : Double?
    var height : Double?
    
    var heightDisplayValue:String? {
        if let height = height {
            return "\(height)"
        } else { return nil }
    }
    
    var weightDisplayValue:String? {
        if let weight = weight {
            return "\(weight)"
        } else { return nil }
    }
    
    var weightUnit : MeasurementUnits?
    var heightUnit : MeasurementUnits?
    
    static let sharedInstance: UserVitals = UserVitals()
    
    private init() {
        //pull from firebase
    }
    
}

protocol TableViewDOBCellDelegate {
    func didSetDOB()
}
