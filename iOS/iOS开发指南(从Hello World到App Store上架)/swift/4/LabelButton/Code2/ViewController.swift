//
//  ViewController.swift
//  Code2
//
//  Created by andyron on 16/8/17.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screen = UIScreen.mainScreen().bounds
        
        let labelWidth: CGFloat = 90
        let labelHeight: CGFloat = 20
        let labelTopView: CGFloat = 150
        self.label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight))
        
        label.text = "Label"
        label.textAlignment = .Center
        self.view.addSubview(label)
        
        let button = UIButton(type: UIButtonType.System)
        button.setTitle("OK", forState: UIControlState.Normal)
        
        let buttonWidth: CGFloat = 60
        let buttonHeight: CGFloat = 20
        let buttonTopView: CGFloat = 240
        
        button.frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight)
        
        button.addTarget(self, action: Selector("onClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func onClick(sender: AnyObject) {
        NSLog("OK Button onClick. Code")
        self.label.text = "Hello, Code"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

