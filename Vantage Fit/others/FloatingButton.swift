//
//  FloatingButton.swift
//  Vantage Fit
//
//  Created by Vantage Circle on 22/08/22.
//

import Foundation
import UIKit

class FloatingButton{
    var btn = UIButton(type: .custom)
    func floatingButton(){
        btn.frame = CGRect(x: 295, y: 640, width: 100, height: 100)
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 35, weight: .medium, scale: .large)
        
        let image = UIImage(systemName: "pencil.tip.crop.circle", withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.tintColor = .white
//        btn.setTitle("Edit", for: .normal)
        btn.backgroundColor = UIColor(rgb: 0xC23B45)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 50
        btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.layer.borderWidth = 3.0
       
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(btn)
        }
        
    }
    
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
