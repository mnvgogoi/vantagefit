//
//  SliderWeightViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 09/08/22.
//

import UIKit

class SliderWeightViewController: UIViewController {

    @IBOutlet weak var popUpCard: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sliderValue: UILabel!
    
    //--initial slider value
    var currentSliderWeightValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpCard.layer.cornerRadius = 20

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderWeightValue = Int(sender.value)
        sliderValue.text = "\(currentSliderWeightValue) kg"
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        print("--------")
        print(currentSliderWeightValue)
        
    }
    
}
