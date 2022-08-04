//
//  DetailsViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 04/08/22.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTable.delegate = self
        detailsTable.dataSource = self
        
        //register cell with table
        detailsTable.register(UINib.init(nibName: "TableViewHeader", bundle: nil), forCellReuseIdentifier: "TableViewHeader")
        
        detailsTable.register(UINib.init(nibName: "TableViewGender", bundle: nil), forCellReuseIdentifier: "TableViewGender")
        
        detailsTable.register(UINib.init(nibName: "TableViewDOB", bundle: nil), forCellReuseIdentifier: "TableViewDOB")
        
        detailsTable.register(UINib.init(nibName: "TableViewHeightWeight", bundle: nil), forCellReuseIdentifier: "TableViewHeightWeight")
        
        detailsTable.register(UINib.init(nibName: "TableViewFooterBtn", bundle: nil), forCellReuseIdentifier: "TableViewFooterBtn")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let detailsCell = detailsTable.dequeueReusableCell(withIdentifier: "TableViewHeader", for: indexPath) as? TableViewHeader
            detailsCell?.layer.cornerRadius = 8
            return detailsCell ?? UITableViewCell()
            
        }
        else if indexPath.row == 1 {
            let detailsCell = detailsTable.dequeueReusableCell(withIdentifier: "TableViewGender", for: indexPath) as? TableViewGender
            detailsCell?.layer.cornerRadius = 8
            return detailsCell ?? UITableViewCell()
        }
        else if indexPath.row == 2 {
            let detailsCell = detailsTable.dequeueReusableCell(withIdentifier: "TableViewDOB", for: indexPath) as? TableViewDOB
            detailsCell?.layer.cornerRadius = 8
            return detailsCell ?? UITableViewCell()
        }
        else if indexPath.row == 3 {
            let detailsCell = detailsTable.dequeueReusableCell(withIdentifier: "TableViewHeightWeight", for: indexPath) as? TableViewHeightWeight
            detailsCell?.layer.cornerRadius = 8
            return detailsCell ?? UITableViewCell()
        }
        else {
            let detailsCell = detailsTable.dequeueReusableCell(withIdentifier: "TableViewFooterBtn", for: indexPath) as? TableViewFooterBtn
            detailsCell?.layer.cornerRadius = 8
            return detailsCell ?? UITableViewCell()
        }
    
        
        
        
    }
    

}
