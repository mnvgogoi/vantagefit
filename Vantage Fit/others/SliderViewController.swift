//
//  SliderViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 08/08/22.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var popUpBackground: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setValueBtn: UIButton!

    
    //--initial slider value
    var currentSliderHeightValue: Int = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBackground.layer.cornerRadius = 20
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderHeightValue = Int(sender.value)
        sliderValue.text = "\(currentSliderHeightValue) cm"
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

// MARK: - custom slider

open class CustomSlider : UISlider {
    @IBInspectable open var trackWidth:CGFloat = 2 {
        didSet {setNeedsDisplay()}
    }

    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
            width: defaultBounds.size.width,
            height: trackWidth
        )
    }
}
