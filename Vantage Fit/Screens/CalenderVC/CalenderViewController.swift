//
//  CalenderViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

protocol DobCollector {
    func didSetDob(value:String)
}

class CalenderViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setDateBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var popUpCard: UIView!
    
    let dateFormatter = DateFormatter()
    
    var dobcollector: DobCollector?
    
    var userVitals = UserVitals.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpCard.layer.cornerRadius = 20
        datePicker.backgroundColor = .white
        
        dateFormatter.dateFormat = "dd.MM.yy"
        datePicker.datePickerMode = .date

        userVitals.dateOfBirth = dateFormatter.string(from: datePicker.date)
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        
//        navigationController?.pushViewController(tableCellDOB, animated: true)
//        present(tableCellDOB, animated: true, completion: nil)
        

    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
    
    @IBAction func datepickerValueChanged(_ sender: UIDatePicker) {
        userVitals.dateOfBirth = dateFormatter.string(from: sender.date)
        view.endEditing(true)
    }
    
    
    @IBAction func setDatePressed(_ sender: UIButton) {
        //*
        if let dobCollector = self.dobcollector{
            if let dob = userVitals.dateOfBirth{
                dobCollector.didSetDob(value: dob)
            }
        }

        dismiss(animated: true,completion: nil)
    }
}






