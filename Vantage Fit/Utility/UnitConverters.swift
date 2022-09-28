//
//  UnitConverters.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 13/08/22.
//

import Foundation

class UnitConverters{
    private let feetConvertFactor = 30.48
    private let inchConvertFactor = 12.00
    
    private let lbsConvertFactor = 2.2046
    
    func convertCmsToFeetAndInches(_ cms : Double) -> (Double,Double){
        let convertedResultInFeet = cms / self.feetConvertFactor
        let convertedResultInInches = ( convertedResultInFeet.truncatingRemainder(dividingBy: 1) ) * self.inchConvertFactor
        return (floor(convertedResultInFeet),convertedResultInInches)
    }
    
    func convertKgToLbs(_ kg : Double) -> Double {
        let convertedResultInLbs = kg * lbsConvertFactor
        return convertedResultInLbs
    }
}
