//
//  ViewController.swift
//  Calculator
//
//  Created by andyron on 2017/3/21.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
//        print("\(digit) was called")
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }

    var displayDouble: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text! = String(newValue)
        }
    }
    
    @IBAction func performOpration(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayDouble = Double.pi
            case "√":
                displayDouble = sqrt(displayDouble)
            default:
                break
            }
        }
    }

}

