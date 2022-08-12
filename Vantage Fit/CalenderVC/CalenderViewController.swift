//
//  CalenderViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

protocol DateOfBirthCellDelegate{
    func getDOB(_ dob: String)
}


class CalenderViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setDateBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var popUpCard: UIView!
    
    let dateFormatter = DateFormatter()
    
    var delegate: DateOfBirthCellDelegate?
    
    var userVitals = UserVitals.getUserVitalsInstance()
    
    
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
        print("------")
        if let dob = userVitals.dateOfBirth{
            print(userVitals.dateOfBirth ?? "default date")
            if let dobDelegate = self.delegate{
                print("dobDelegate---")
                dobDelegate.getDOB(dob)
            }

        }
        

        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
}






