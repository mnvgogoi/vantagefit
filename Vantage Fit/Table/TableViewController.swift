//
//
//
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = UserDetailsViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        //register cells with table
        UserDetailsViewPresenter.allItems.forEach (
            {
                tableView.register($0.nib, forCellReuseIdentifier: $0.identifier)
            }
        )
    }
}

// MARK: - extenstions

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        
        var value = 100

        switch indexPath.row{
        case 0:
            value = 100
        case 1:
            value = 250
        case 2:
            value = 170
        case 3:
            value = 150
        case 4:
            value = 100
        default:
            value = 100
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
            
            return detailsCell ?? UITableViewCell()
            
        case .heightWeight:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeightWeight", for: indexPath) as? TableViewHeightWeight
            detailsCell?.selectionStyle = .none
            
            //for height card----
            detailsCell?.backgroundCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displaySlider)))
            //for weight card---
            detailsCell?.backgroundCardWeight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displayWeightSlider)))
            
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
        self.present(calenderViewController, animated: true, completion: nil)
    }
    
    @objc func displaySlider() {
        let heightSliderViewController = HeightSliderViewController(nibName: "HeightSliderViewController", bundle: nil)
        self.present(heightSliderViewController, animated: true, completion: nil)
    }
    
    @objc func displayWeightSlider() {
        let weightViewController = WeightViewController(nibName: "WeightViewController", bundle: nil)
        self.present(weightViewController, animated: true, completion: nil)
    }
    
    @objc func displayResultVC(sender : UIButton) {
        let resultViewController = ResultViewController(nibName: "ResultViewController", bundle: nil)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}


