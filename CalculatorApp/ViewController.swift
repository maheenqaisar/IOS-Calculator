//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Maheen on 01/02/2023.
//

import UIKit

enum Operations: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "null"
}

class ViewController: UIViewController {

    @IBOutlet weak var OutputLabel: UILabel!
    
    var RunningNumber = ""
    var LeftValue = ""
    var RightValue = ""
    var Result = ""
    var CurrentOperation: Operations = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OutputLabel.text = "0"
    }

    @IBAction func NumberPressed(_ sender: RoundButton) {
        if RunningNumber.count <= 10 {
            RunningNumber += "\(sender.tag)"
            OutputLabel.text = RunningNumber
        }
    }
    
    @IBAction func AllClearPressed(_ sender: RoundButton) {
        RunningNumber = ""
        LeftValue = ""
        RightValue = ""
        Result = ""
        CurrentOperation = .NULL
        OutputLabel.text = "0"
    }
    
    @IBAction func DotPressed(_ sender: RoundButton) {
        if RunningNumber.count <= 7 {
            RunningNumber += "."
            OutputLabel.text = RunningNumber
        }
    }
    
    @IBAction func EqualPressed(_ sender: RoundButton) {
        operation(operation: CurrentOperation)
    }
    
    @IBAction func AddPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func MinusPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func MultiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func DividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operations) {
        if CurrentOperation != .NULL {
            if RunningNumber != "" {
                RightValue = RunningNumber
                RunningNumber = ""
                
                if CurrentOperation == .Add {
                    Result = "\(Double(LeftValue)! + Double(RightValue)!)"
                } else if CurrentOperation == .Subtract {
                    Result = "\(Double(LeftValue)! - Double(RightValue)!)"
                } else if CurrentOperation == .Multiply {
                    Result = "\(Double(LeftValue)! * Double(RightValue)!)"
                } else if CurrentOperation == .Divide {
                    Result = "\(Double(LeftValue)! / Double(RightValue)!)"
                }
                LeftValue = Result
                if (Double(Result)!.truncatingRemainder(dividingBy: 1) == 0){
                    Result = "\(Int(Double(Result)!))"
                }
                OutputLabel.text = Result
            }
            CurrentOperation = operation
        } else {
            LeftValue = RunningNumber
            RunningNumber = ""
            CurrentOperation = operation
        }
    }
}

