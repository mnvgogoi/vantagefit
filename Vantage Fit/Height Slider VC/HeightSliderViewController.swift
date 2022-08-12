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
 
    
    
    //--initial slider value
    var currentSliderHeightValue: Double = 180
    var measurement = MeasurementUnits.cm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBackground.layer.cornerRadius = 20
        slider.minimumValue = 125
        slider.maximumValue = 250
        
        sliderValue.text = String(format: "%.f", currentSliderHeightValue) + " \(measurement)"
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderHeightValue = Double(sender.value)
        sliderValue.text = "\(String(format: "%.f", currentSliderHeightValue)) \(measurement)"
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        //--
        print("--------")
        print(currentSliderHeightValue)
        
    }
}


