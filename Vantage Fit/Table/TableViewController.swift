//
//
//
//

import UIKit

class TableViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = UserDetailsViewPresenter()
    lazy var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        //register cells with table
        UserDetailsViewPresenter.allItems.forEach (
            {
                tableView.register($0.nib, forCellReuseIdentifier: $0.identifier)
            }
        )
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate extenstions

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        
        var value = 80

        switch indexPath.row{
        case 0:
            value = 80
        case 1:
            value = 250
        case 2:
            value = 170
        case 3:
            value = 150
        case 4:
            value = 100
        default:
            value = 80
        }

        return CGFloat(value)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch UserDetailsViewPresenter.allItems[indexPath.row]{
        case .header:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeader", for: indexPath) as? TableViewHeader
            detailsCell?.selectionStyle = .none
            return detailsCell ?? UITableViewCell()
            
        case .gender:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewGendertwo", for: indexPath) as? TableViewGendertwo
            
            detailsCell?.selectionStyle = .none
            return detailsCell ?? UITableViewCell()
            
        case .dob:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewDOB", for: indexPath) as? TableViewDOB
            detailsCell?.selectionStyle = .none
            detailsCell?.calenderBtn.addTarget(self, action: #selector(self.calenderPopUP(sender:)), for: .touchUpInside);
            detailsCell?.setData(dobValue: UserVitals.sharedInstance.dateOfBirthValue)
            return detailsCell ?? UITableViewCell()
            
        case .heightWeight:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeightWeight", for: indexPath) as? TableViewHeightWeight
            detailsCell?.selectionStyle = .none
            
            //for height card----
            detailsCell?.backgroundCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displaySlider)))
            //for weight card---
            detailsCell?.backgroundCardWeight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displayWeightSlider)))
            
            detailsCell?.setData(heightValue: UserVitals.sharedInstance.heightDisplayValue, weightValue: UserVitals.sharedInstance.weightDisplayValue)
            
            return detailsCell ?? UITableViewCell()
            
        case .footer:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFooterBtn", for: indexPath) as? TableViewFooterBtn
            detailsCell?.selectionStyle = .none
            //*
            detailsCell?.continueBtn.addTarget(self, action: #selector(self.displayResultVC(sender:)), for: .touchUpInside);
            return detailsCell ?? UITableViewCell()
        }
    
    }
    
    // MARK: - functions
    
    @objc func calenderPopUP(sender : UIButton){
        let calenderViewController = CalenderViewController(nibName: "CalenderViewController", bundle: nil)
        calenderViewController.dobcollector = self
        self.present(calenderViewController, animated: true, completion: nil)
    }
    
    @objc func displaySlider() {
        let heightSliderViewController = HeightSliderViewController(nibName: "HeightSliderViewController", bundle: nil)
        heightSliderViewController.collector = self
        self.present(heightSliderViewController, animated: true, completion: nil)
    }
    
    @objc func displayWeightSlider() {
        let weightViewController = WeightViewController(nibName: "WeightViewController", bundle: nil)
        //*
        weightViewController.collector = self
        self.present(weightViewController, animated: true, completion: nil)
    }
    
    @objc func displayResultVC(sender : UIButton) {
        if(validator.areUserVitalsEmpty(UserVitals.sharedInstance)){
            let resultViewController = ResultViewController(nibName: "ResultViewController", bundle: nil)
            navigationController?.pushViewController(resultViewController, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Vitals cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

// MARK: - Custom extensions

extension TableViewController: LengthCollector {
    
    func didSetNewLength(type: Int, value: Double) {
        if let rowNumber = UserDetailsViewPresenter.allItems.firstIndex(where: {$0 == .heightWeight}) {
            let indexPathToReload = IndexPath(row: rowNumber, section: 0)
            self.tableView.reloadRows(at: [indexPathToReload], with: .fade)
        }
    }
    
}

extension TableViewController: DobCollector{
    func didSetDob(value: String) {
        if let rowNumber = UserDetailsViewPresenter.allItems.firstIndex(where: {$0 == .dob}) {
            let indexPathToReload = IndexPath(row: rowNumber, section: 0)
            self.tableView.reloadRows(at: [indexPathToReload], with: .fade)
        }
    }
    
    
}



