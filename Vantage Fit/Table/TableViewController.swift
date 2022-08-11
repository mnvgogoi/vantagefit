//
//  TableViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 10/08/22.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        //register cell with table
        tableView.register(UINib.init(nibName: "TableViewHeader", bundle: nil), forCellReuseIdentifier: "TableViewHeader")
        
        tableView.register(UINib.init(nibName: "TableViewGendertwo", bundle: nil), forCellReuseIdentifier: "TableViewGendertwo")
        
        tableView.register(UINib.init(nibName: "TableViewDOB", bundle: nil), forCellReuseIdentifier: "TableViewDOB")
        
        tableView.register(UINib.init(nibName: "TableViewHeightWeight", bundle: nil), forCellReuseIdentifier: "TableViewHeightWeight")
        
        tableView.register(UINib.init(nibName: "TableViewFooterBtn", bundle: nil), forCellReuseIdentifier: "TableViewFooterBtn")
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
        if indexPath.row == 0 {

            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeader", for: indexPath) as? TableViewHeader
            detailsCell?.selectionStyle = .none
            return detailsCell ?? UITableViewCell()

        }
        else if indexPath.row == 1 {
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewGendertwo", for: indexPath) as? TableViewGendertwo
            
            detailsCell?.selectionStyle = .none
            return detailsCell ?? UITableViewCell()
        }
        else if indexPath.row == 2 {
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewDOB", for: indexPath) as? TableViewDOB
            detailsCell?.selectionStyle = .none
            detailsCell?.calenderBtn.addTarget(self, action: #selector(self.calenderButton(sender:)), for: .touchUpInside);
            
            return detailsCell ?? UITableViewCell()
        }
        else if indexPath.row == 3 {
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeightWeight", for: indexPath) as? TableViewHeightWeight
            detailsCell?.selectionStyle = .none
            
            //for height card----
            detailsCell?.backgroundCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displaySlider)))
            //for weight card---
            detailsCell?.backgroundCardWeight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.displayWeightSlider)))

            
            return detailsCell ?? UITableViewCell()
        }
        else {
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFooterBtn", for: indexPath) as? TableViewFooterBtn
            detailsCell?.selectionStyle = .none
            return detailsCell ?? UITableViewCell()
        }
    
    }
    
    // MARK: - functions
    
    @objc func calenderButton(sender : UIButton){
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
    
}


