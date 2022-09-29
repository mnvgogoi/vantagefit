//
//  UserVitals.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 11/08/22.
//

import Foundation
import FirebaseFirestoreSwift

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
    var heightInFeetAndInches = [0.0,0.0]
    var weightInPounds : Double?
    var countryCode : String?
    var pullStatus : Bool = false
    
    var dateOfBirthValue : String? {
        let currentRegion = NSLocale.current.regionCode
        if self.countryCode == currentRegion{
            return self.dateOfBirth
        }
        else{
            var dateArray = self.dateOfBirth?.split(separator: "-")
            let firstCompOfDateArr = dateArray![0]
            dateArray![0] = dateArray![1]
            dateArray![1] = firstCompOfDateArr
            return dateArray?.joined(separator: "-")
        }
    }
    
    var heightDisplayValue:String? {
        switch(NSLocale.current.regionCode){
            case CountryCodes.IN.rawValue :
                if let height = height {
                    return "\(String(format: "%.0f", height)) cm"
                } else { return nil }
            
            case CountryCodes.US.rawValue :
                return "\(String(format: "%.f", heightInFeetAndInches[0])) \(MeasurementUnits.ft) \(String(format: "%.1f", heightInFeetAndInches[1])) \(MeasurementUnits.inch)"
            default :
                return ""
        }
    }
    
    var weightDisplayValue:String? {
        
        switch(NSLocale.current.regionCode){
            case CountryCodes.IN.rawValue :
                if let weight = weight {
                    return "\(String(format: "%.0f", weight)) kg"
                } else { return nil }
            
            case CountryCodes.US.rawValue :
                if let weightInPounds = weightInPounds {
                    return "\(String(format: "%.2f", weightInPounds)) \(MeasurementUnits.lbs)"
                }
            default :
                return ""
        }
        return ""
    }
    
    var weightUnit : MeasurementUnits?
    var heightUnit : MeasurementUnits?
    
    static let sharedInstance: UserVitals = UserVitals()
    
    private init() {
        pullFromFirestore()
    }
    
    func prepareData(_ userVitalsInstance : UserVitals) -> UserVitalsData{
        return UserVitalsData(gender: userVitalsInstance.gender, dateOfBirth: userVitalsInstance.dateOfBirth, weight: userVitalsInstance.weight, height: userVitalsInstance.height,weightInPounds: userVitalsInstance.weightInPounds,heightInFeetAndInches: userVitalsInstance.heightInFeetAndInches,countryCode: NSLocale.current.regionCode)
    }
    
    func pushToFirestore(_ userVitalsInstance : UserVitals) -> Bool{
        var pushStatus = true
        let db = FirestoreDB.firestoreDBSharedInstance
        let userEmail = getUserEmail()
        guard userEmail != nil else {
            return false
        }
        let userVitalsData = prepareData(userVitalsInstance)
        do{
            try db.collection(DocumentBodyLabels.userVitals.rawValue).document(userEmail!).setData(from: userVitalsData)
        }
        catch{
            pushStatus = false
        }
        
        return pushStatus
    }
    
    func pullFromFirestore(){
        var userVitals : UserVitalsData?
        let db = FirestoreDB.firestoreDBSharedInstance
        let userEmail = getUserEmail()
        guard userEmail != nil else {
            return
        }
        let userVitalsDocument = db.collection(DocumentBodyLabels.userVitals.rawValue).document(userEmail!)
        userVitalsDocument.getDocument { document, error in
            if let document = document, document.exists {
                    do{
                        try userVitals = document.data(as: UserVitalsData.self)
                        self.gender = userVitals?.gender
                        self.dateOfBirth = userVitals?.dateOfBirth
                        self.weight = userVitals?.weight
                        self.height = userVitals?.height
                        self.weightInPounds = userVitals?.weightInPounds
                        self.heightInFeetAndInches = (userVitals?.heightInFeetAndInches)!
                        self.countryCode = userVitals?.countryCode
                        self.pullStatus = true
                    }
                    catch{
                        self.pullStatus = false
                    }
                }
            else{
                self.pullStatus = false
            }
        }
    }
    
}

extension String{
    
    func localize() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}


