//
//  WeightViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

class WeightViewController: UIViewController {

    @IBOutlet weak var popUpCard: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sliderValue: UILabel!
    
    
    //--initial slider value
    var currentSliderWeightValue: Double = 50
    var measurement = MeasurementUnits.kg
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpCard.layer.cornerRadius = 20
        slider.minimumValue = 30
        slider.maximumValue = 200
        
        sliderValue.text = String(format: "%.f", currentSliderWeightValue) + " \(measurement)"

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderWeightValue = Double(sender.value)
        sliderValue.text = "\(String(format: "%.f", currentSliderWeightValue)) \(measurement)"
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        print("--------")
        print(slider.value)

        
    }
    


}
