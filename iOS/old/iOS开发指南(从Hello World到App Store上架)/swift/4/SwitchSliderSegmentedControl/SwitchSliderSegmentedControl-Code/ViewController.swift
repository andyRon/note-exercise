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
        
        //3. segmentControl
        let segments = ["Right", "Left"]
        let segmentedControl = UISegmentedControl(items: segments)
        
        let scWidth: CGFloat = 220
        let scHeight: CGFloat = 29
        let scTopView: CGFloat = 186
        frame = CGRectMake((screen.size.width - scWidth)/2, scTopView, scWidth, scHeight)
        segmentedControl.frame = frame
        
        segmentedControl.addTarget(self, action: Selector("touchDown:"), forControlEvents: .ValueChanged)
        
        self.view.addSubview(segmentedControl)
        
        //4. slider
        let sliderWidth: CGFloat = 300
        let sliderHeight: CGFloat = 31
        let sliderTopView: CGFloat = 298
        frame = CGRectMake((screen.size.width - sliderWidth)/2, sliderTopView, sliderWidth, sliderHeight)
        let slider = UISlider(frame: frame)
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
        
        slider.addTarget(self, action: "sliderValueChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(slider)
        
        //5 添加"SliderValue"标签
        let labelSliderValueSpace: CGFloat = 30
        frame = CGRectMake(slider.frame.origin.x, slider.frame.origin.y - labelSliderValueSpace, 103, 21)
        let labelSliderValue = UILabel(frame: frame)
        
        labelSliderValue.text = "SliderValue:"
        self.view.addSubview(labelSliderValue)
        
        //6 添加sliderValue标签
        frame = CGRectMake(labelSliderValue.frame.origin.x + 120, labelSliderValue.frame.origin.y, 50, 21)
        self.sliderValue = UILabel(frame: frame)
        self.sliderValue.text = "50"
        self.view.addSubview(self.sliderValue)
        
    }
    
    func switchValueChanged(sender: AnyObject) {
        let withSwitch = sender as! UISwitch
        let setting = withSwitch.on
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    func touchDown(sender: AnyObject) {
        let segmentControl = sender as! UISegmentedControl
        
        NSLog("选择的段: %li", segmentControl.selectedSegmentIndex)
        
        if (self.leftSwitch.hidden == true) {
            self.rightSwitch.hidden = false
            self.leftSwitch.hidden = false
        } else {
            self.leftSwitch.hidden = true
            self.rightSwitch.hidden = true
        }
    }
    
    func sliderValueChange(sender: AnyObject) {
        let slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = NSString(format: "%d", progressAsInt)
        self.sliderValue.text = newText as String
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

