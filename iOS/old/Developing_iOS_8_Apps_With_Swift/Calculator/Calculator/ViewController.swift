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
//        println("digit = \(digit)")
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if useIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "×":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
                }
            case "÷":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() / operandStack.removeLast()
                    enter()
                }
            case "+":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() + operandStack.removeLast()
                    enter()
                }
            case "−":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() - operandStack.removeLast()
                    enter()
                }
        }
        
        
    }
    var operandStack: Array<Double> = Array<Double>()
    @IBAction func enter() {
        useIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            useIsInTheMiddleOfTypingANumber = false
            print("123")
        }
    }
    
}

