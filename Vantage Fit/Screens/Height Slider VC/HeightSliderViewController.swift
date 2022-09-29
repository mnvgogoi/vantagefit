//
// using LengthCollector from WeightVC
//

import UIKit

class HeightSliderViewController: UIViewController {
    
    @IBOutlet weak var popUpBackground: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setValueBtn: UIButton!
    @IBOutlet weak var heightFeetInchLabel: UILabel!
    

    //--initial slider value
    var currentSliderHeightValue: Double = 125
    var measurement = MeasurementUnits.cm
    
    var finalHeight: Double = 125
    
    var unitConverter = UnitConverters()
    
    var userVitals = UserVitals.sharedInstance
    
    //* instance of LengthCollector Protocol
    var collector: LengthCollector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpLabel.text = HeightViewControllerStrings.heightString.rawValue.localize()
        self.setValueBtn.setTitle(HeightViewControllerStrings.setBtnString.rawValue.localize(), for: .normal)
        self.cancelBtn.setTitle(HeightViewControllerStrings.cancelBtnString.rawValue.localize(), for: .normal)
        popUpBackground.layer.cornerRadius = 20
        slider.minimumValue = 125
        slider.maximumValue = 250
        
        if let userHeight = userVitals.height{
            slider.value = Float(userHeight)
            sliderValue.text = String(format: "%.f", userHeight) + " \(measurement)"
        }
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentSliderHeightValue = Double(sender.value)
        sliderValue.text = "\(String(format: "%.f", currentSliderHeightValue)) \(measurement)"
        
        finalHeight = currentSliderHeightValue.rounded()
        sliderValue.text = "\(String(format: "%.f", finalHeight)) \(measurement)"
        
        let (cmToFeet, cmToInches) = unitConverter.convertCmsToFeetAndInches(finalHeight)
        userVitals.heightInFeetAndInches[0] = cmToFeet
        userVitals.heightInFeetAndInches[1] = cmToInches
        heightFeetInchLabel.text = "\(String(format: "%.f", cmToFeet)) \(MeasurementUnits.ft) \(String(format: "%.1f", cmToInches)) \(MeasurementUnits.inch)"
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        //--
        print("--------")
        print(finalHeight)
        
        userVitals.height = finalHeight
        userVitals.heightUnit = MeasurementUnits.cm
        
        //*
        if let heightCollector = self.collector{
            heightCollector.didSetNewLength(type: LengthUnit.Height.rawValue, value: finalHeight)
        }
        
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
      
    }
}




