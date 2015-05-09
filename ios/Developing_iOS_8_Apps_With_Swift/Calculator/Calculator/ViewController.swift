//
//  ViewController.swift
//  Calculator
//
//  Created by andyron on 15/4/26.
//  Copyright (c) 2015年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    var useIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if useIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            useIsInTheMiddleOfTypingANumber = true
        }
        
        println("digit = \(digit)")
    }

}

