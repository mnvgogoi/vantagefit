//
//  TableViewGendertwo.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 05/08/22.
//

import UIKit

class TableViewGendertwo: UITableViewCell {

    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var genderBackgroundImage: UIImageView!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var othersLabel: UILabel!
    
    @IBOutlet weak var noDiscloseBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var othersBtn: UIButton!
    
    var genderValue = "No Value"
    
    var userVitals = UserVitals.sharedInstance
    
    override func awakeFromNib() {
        super.awakeFromNib()
        genderBackgroundImage.layer.cornerRadius = 25
        genderBackgroundImage.backgroundColor = UIColor(rgb: 0xC23B45)
        
        noDiscloseBtn.layer.cornerRadius = 20
        noDiscloseBtn.layer.borderWidth = 3
        noDiscloseBtn.layer.borderColor = UIColor.white.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func optionSelected(_ isOptionSelected: Int) {
        
        switch isOptionSelected
        {
        case 1:
            self.maleBtn.isSelected = true
            self.femaleBtn.isSelected = false
            self.othersBtn.isSelected = false
            self.noDiscloseBtn.isSelected = false
            genderValue = "Male"
            userVitals.gender = Gender.Male
            noDiscloseBtn.layer.borderColor = UIColor.white.cgColor
            
        case 2:
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = true
            self.othersBtn.isSelected = false
            self.noDiscloseBtn.isSelected = false
            genderValue = "Female"
            userVitals.gender = Gender.Female
            noDiscloseBtn.layer.borderColor = UIColor.white.cgColor
            
        case 3:
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = false
            self.othersBtn.isSelected = true
            self.noDiscloseBtn.isSelected = false
            genderValue = "Others"
            userVitals.gender = Gender.Others
            noDiscloseBtn.layer.borderColor = UIColor.white.cgColor
            
        case 4:
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = false
            self.othersBtn.isSelected = false
            self.noDiscloseBtn.isSelected = true
            genderValue = "Not Disclosed"
            userVitals.gender = Gender.Unspecified
            
            noDiscloseBtn.layer.borderColor = UIColor(rgb: 0xC70039).cgColor
            
        default:
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = false
            self.othersBtn.isSelected = false
            self.noDiscloseBtn.isSelected = false
            genderValue = "No Value"
            userVitals.gender = Gender.Unspecified
            noDiscloseBtn.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func maleBtnpressed(_ sender: UIButton) {
        optionSelected(1)
        print(genderValue)
    }
    
    @IBAction func femaleBtnPressed(_ sender: UIButton) {
        optionSelected(2)
        print(genderValue)

    }
    @IBAction func othersBtnPressed(_ sender: UIButton) {
        optionSelected(3)
        print(genderValue)
    }
    
    @IBAction func noDisclosePressed(_ sender: UIButton) {
        optionSelected(4)
        print(genderValue)
    }
    
}

// MARK: - UIcolor
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
