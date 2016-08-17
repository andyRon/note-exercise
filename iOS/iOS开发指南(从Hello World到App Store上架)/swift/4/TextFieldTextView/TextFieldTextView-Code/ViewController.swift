//
//  ViewController.swift
//  TextFieldTextView-Code
//
//  Created by andyron on 16/8/18.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screen = UIScreen.mainScreen().bounds
        
        let textFieldWidth: CGFloat = 223
        let textFieldHeight: CGFloat = 30
        let textFieldTopView: CGFloat = 150
        let textField = UITextField(frame: CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight))
        
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        let labelNameTextFieldSpace: CGFloat = 30
        let labelName = UILabel(frame: CGRectMake(textField.frame.origin.x, textField.frame.origin.y - labelNameTextFieldSpace, 51, 21))
        labelName.text = "Name:"
        self.view.addSubview(labelName)
        
        let textViewWidth: CGFloat = 236
        let textViewHeight: CGFloat = 198
        let textViewTopView: CGFloat = 240
        let textView = UITextView(frame: CGRectMake((screen.size.width - textViewWidth)/2, textViewTopView, textViewWidth, textViewHeight))
        textView.text = "Lorem ipsum dolor ..."
        
        textView.delegate = self
        self.view.addSubview(textView)
        
        let labelAbstractTextViewSpace: CGFloat = 30
        let labelAbstract = UILabel(frame: CGRectMake(textView.frame.origin.x, textView.frame.origin.y - labelAbstractTextViewSpace, 103, 21))
        
        labelAbstract.text = "Abstract:"
        self.view.addSubview(labelAbstract)
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

