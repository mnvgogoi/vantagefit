//
//  HeightSliderViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

class HeightSliderViewController: UIViewController {
    
    @IBOutlet weak var popUpBackground: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setValueBtn: UIButton!
    @IBOutlet weak var heightUnitSwitch: UISwitch!
    
    
    //--initial slider value
    var currentSliderHeightValue: Double = 180
    //    var measurement = MeasurementUnits.kg
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBackground.layer.cornerRadius = 20
        slider.minimumValue = 125
        slider.maximumValue = 250
        
        //        sliderValue.text = String(format: "%.f", currentSliderHeightValue) + " \(measurement)"
        sliderValue.text = String(format: "%.f", currentSliderHeightValue) + " cm"
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderHeightValue = Double(sender.value)
        //        sliderValue.text = "\(String(format: "%.f", currentSliderHeightValue))  \(measurement)"
        sliderValue.text = "\(String(format: "%.f", currentSliderHeightValue))  cm"
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    
    @IBAction func heightUnitChanged(_ sender: UISwitch) {
        if (sender.isOn){
            //            measurement = MeasurementUnits.cm
            //
            //            sliderValue.text = String(format: "%.f", currentSliderHeightValue) + "\(measurement)"
            //
            //            let centimeter = String(format: "%.f", 2.54 * currentSliderHeightValue)
            
            //            slider.minimumValue = 125
            //            slider.maximumValue = 250
            //            slider.value = Float(centimeter)!
            print("cm")
        }
        else{
            //            measurement = MeasurementUnits.ft
            //
            //            let inch = 0.3937 * currentSliderHeightValue;
            //            let feet = 0.0328 * currentSliderHeightValue;
            //
            //            sliderValue.text = String(format: "%.f", feet)  + " \(measurement)" + " . " + String(format: "%.f", inch) + "inch"
            
            //            slider.minimumValue = 4.10
            //            slider.maximumValue = 8.20
            //            slider.value = Float(feet)
            
            
            print("ft")
        }
    }
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        //--
        print("--------")
        print(currentSliderHeightValue)
        
    }
}


