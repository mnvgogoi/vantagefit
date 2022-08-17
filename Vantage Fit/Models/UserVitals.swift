//
//  UserVitals.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 11/08/22.
//

import Foundation

class UserVitals{
    var gender : Gender?
    var dateOfBirth : String?
    var weight : Double?
    var height : Double?
    var weightUnit : MeasurementUnits?
    var heightUnit : MeasurementUnits?
    
    static private var userVitalsInstance:UserVitals?
    
    private init(){}
    
    static func getUserVitalsInstance() -> UserVitals{
        if userVitalsInstance == nil{
            userVitalsInstance = UserVitals()
        }
        return userVitalsInstance!
    }
    
}

protocol TableViewDOBCellDelegate {
    func didSetDOB()
}
