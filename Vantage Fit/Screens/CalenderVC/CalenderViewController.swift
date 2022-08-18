//
//  CalenderViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit


class CalenderViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setDateBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var popUpCard: UIView!
    
    let dateFormatter = DateFormatter()
    
    //*
    var delegate: TableViewDOBCellDelegate?
    
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
        delegate?.didSetDOB()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
    }
}






