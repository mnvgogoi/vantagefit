//
//  Validator.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 22/08/22.
//

import Foundation

class Validator{
    
    func areUserVitalsEmpty(_ userVitalsInstance : UserVitals) -> Bool{
        return ((userVitalsInstance.gender != nil) && (userVitalsInstance.dateOfBirth != nil) &&
                (userVitalsInstance.weight != nil) && (userVitalsInstance.height != nil))
    }
}
