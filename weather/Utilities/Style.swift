//
//  Style.swift
//  weather
//
//  Created by Scott Courtney on 3/16/21.
//

import Foundation
import UIKit

class Style {
    static func styleTextField(_ textfield:UITextField) {
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x:0, y: textfield.frame.height - 2,
                                  width: textfield.frame.width,
                                  height: 2)
        bottomLine.backgroundColor = UIColor.black.cgColor

        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleButton(_ button:UIButton) {
            
        button.layer.cornerRadius = 8
        
        button.layer.borderWidth = 1
        
        button.layer.borderColor = UIColor.black.cgColor
    }
}
