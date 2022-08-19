//
//  WeightViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

protocol LengthCollector {
    func didSetNewLength(type:Int, value:Double)
}

enum LengthUnit:Int {
    case Weight = 0
    case Height = 1
}

class WeightViewController: UIViewController {

    @IBOutlet weak var popUpCard: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var weightPoundLabel: UILabel!
    
    
    //--initial slider value
    var currentSliderWeightValue: Double = 30
    var measurement = MeasurementUnits.kg
    var finalWeight: Double = 30
    
    var unitConverter = UnitConverters()
    
    var userVitals = UserVitals.sharedInstance
    
    var collector:LengthCollector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpCard.layer.cornerRadius = 20
        slider.minimumValue = 30
        slider.maximumValue = 200
        
        if let userWeight = userVitals.weight{
            slider.value = Float(userWeight)
            sliderValue.text = String(format: "%.f", userWeight) + " \(measurement)"
        }

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderWeightValue = Double(sender.value)
        finalWeight = currentSliderWeightValue.rounded()
        sliderValue.text = "\(String(format: "%.f", finalWeight)) \(measurement)"
        
        let kiloToLbs = unitConverter.convertKgToLbs(finalWeight)
        weightPoundLabel.text = "\(String(format: "%.2f", kiloToLbs)) \(MeasurementUnits.lbs)"
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        print("--------")
        print(finalWeight)
        
        userVitals.weight = finalWeight
        userVitals.weightUnit = MeasurementUnits.kg
        
        //*
        if let weightCollector = self.collector{
            weightCollector.didSetNewLength(type: LengthUnit.Weight.rawValue, value: finalWeight)
        }
        
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)

        
    }
    


}
