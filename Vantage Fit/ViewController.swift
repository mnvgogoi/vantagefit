//
//  ViewController.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var manualDataBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func manualDataPressed(_ sender: UIButton) {
        //create instance
        let tableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
        //to present a vc
//        self.present(tableViewController, animated: true, completion: nil)
        
            //to  navigate into other vc
        if let navigationController = self.navigationController {
                navigationController.pushViewController(tableViewController, animated: true)
            } else {
                print("Navigation controller unavailable!")
            }
    }
}


