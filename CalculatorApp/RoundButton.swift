//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by Maheen on 01/02/2023.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
