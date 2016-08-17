//
//  ViewController.swift
//  TextFieldTextView
//
//  Created by andyron on 16/8/18.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //TextField获得焦点，点击return时调用
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NSLog("TextField获得焦点，点击return键")
        return true
    }
    //修改TextView内文本时调用
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            NSLog("TextView获得焦点, 点击return键")
            return false
        }
        return true
    }

}

