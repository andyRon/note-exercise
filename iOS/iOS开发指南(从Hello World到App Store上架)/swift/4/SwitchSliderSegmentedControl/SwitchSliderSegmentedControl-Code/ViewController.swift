//
//  ViewController.swift
//  SwitchSliderSegmentedControl-Code
//
//  Created by andyron on 16/8/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftSwitch: UISwitch!
    var rightSwitch: UISwitch!
    var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screen = UIScreen.mainScreen().bounds
        
        //1. leftSwitch
        // switch与屏幕之间的边距
        let switchScreenSpace: CGFloat = 39
        
        self.leftSwitch = UISwitch()
        var frame = self.leftSwitch.frame
        frame.origin = CGPointMake(switchScreenSpace, 98)
        
        self.leftSwitch.frame = frame
        self.leftSwitch.on = true
        self.leftSwitch.addTarget(self, action: Selector("switchValueChanged:"), forControlEvents: .ValueChanged)
        
        self.view.addSubview(self.leftSwitch)
        
        //2. rightSwitch
        self.rightSwitch = UISwitch()
        frame = self.rightSwitch.frame
        frame.origin = CGPointMake((screen.width - frame.size.width - switchScreenSpace), 98)
        
        self.rightSwitch.frame = frame
        self.rightSwitch.on = true
        self.rightSwitch.addTarget(self, action: Selector("switchValueChanged:"), forControlEvents: .ValueChanged)
        
        self.view.addSubview(self.rightSwitch)
        
        
    }
    
    func switchValueChanged(sender: AnyObject) {
        var withSwitch = sender as! UISwitch
        var setting = withSwitch.on
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

