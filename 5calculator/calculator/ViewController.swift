//
//  ViewController.swift
//  calculator
//
//  Created by User on 27.08.2020.
//  Copyright © 2020 sad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var stillTyping = false
    var point = false
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation = ""
    
    var input: Double {
        get {
            return Double(outputLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                outputLabel.text = valueArray[0]
            } else {
                outputLabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cleanAll(_ sender: UIButton) {
        outputLabel.text = "0"
        firstNumber = 0
        secondNumber = 0
        stillTyping = false
        operation = ""
        point = false
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        if stillTyping == true {
            if let text = outputLabel.text {
                if text.count < 20 {
                    outputLabel.text = text + number
                }
            }
        } else {
            outputLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        operation = title
        firstNumber = input
        stillTyping = false
        point = false
    }
    
    @IBAction func equal(_ sender: UIButton) {
        if stillTyping == true {
            secondNumber = input
        }
        
        point = false
        
        switch operation {
        case "+":
            input = firstNumber + secondNumber
            stillTyping = false
            case "-":
            input = firstNumber - secondNumber
            stillTyping = false
            case "x":
            input = firstNumber * secondNumber
            stillTyping = false
            case "/":
            input = firstNumber / secondNumber
            stillTyping = false
            
        default:
            break
        }
    }
    
    @IBAction func procentage(_ sender: UIButton) {
        if firstNumber == 0 {
            input = input / 100
        } else {
            secondNumber = firstNumber * input / 100
        }
    }
    
    @IBAction func point(_ sender: UIButton) {
        if stillTyping == true && point == false {
            if var text = outputLabel.text {
                text += "."
                outputLabel.text = text
                point = true
            } else {
                if stillTyping == false && point == true {
                    if var text = outputLabel.text {
                        text += "0."
                        outputLabel.text = text
                    }
                }
            }
        }
    }
}
